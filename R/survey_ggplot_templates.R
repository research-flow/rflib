#' GGPlot template for total part-whole survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot or grid object
survey_ggplot_resz_egesz_total <- function(question) {
    gridExtra::grid.arrange(
        gridExtra::arrangeGrob(
            question$wrangled %>%
                ggplot2::ggplot(ggplot2::aes(x = answer)) +
                ggplot2::geom_histogram(ggplot2::aes(alpha = ggplot2::after_stat(count), fill = valasz_szovege), color = "black", bins = 7) +
                ggplot2::facet_wrap(~valasz_szovege, scales = "free") +
                ggplot2::scale_x_continuous(breaks = rflib::integer_breaks(), labels = scales::label_comma()) +
                ggplot2::scale_y_continuous(breaks = rflib::integer_breaks(), labels = scales::label_comma()) +
                ggplot2::scale_fill_manual(values = question$color_scale) +
                ggplot2::scale_alpha_continuous(range = c(0.45, 1)) +
                ggplot2::guides(alpha = "none", fill = "none") +
                ggplot2::labs(
                    x = "Válasz", fill = "Válasz", y = "Válaszok száma",
                    subtitle = question$group
                ) +
                ggplot2::theme_minimal() +
                ggplot2::theme(
                    strip.text = ggplot2::element_text(size = 14),
                    axis.text = ggplot2::element_text(size = 12),
                    axis.title = ggplot2::element_text(size = 14),
                    legend.title = ggplot2::element_text(size = 14),
                    plot.background = ggplot2::element_rect(colour = NA, fill = NA, linewidth = 1),
                    legend.text = ggplot2::element_text(size = 12),
                    plot.margin = unit(c(0, 2, 0, 2), "cm")
                ),
            question$wrangled %>%
                dplyr::select(kerdes, valasz_szovege, mean, mean_perc) %>%
                unique() %>%
                dplyr::mutate(
                    valasz_szovege = forcats::fct_reorder(valasz_szovege, mean)
                ) |>
                ggplot2::ggplot(ggplot2::aes(y = mean_perc, x = "", fill = valasz_szovege)) +
                ggplot2::geom_col(width = 0.9, position = ggplot2::position_stack(), color = "black") +
                ggplot2::geom_text(
                    ggplot2::aes(label = ifelse(
                        mean_perc < 0.07, "", scales::percent(mean_perc, accuracy = 0.1)
                    )),
                    size = 5,
                    fontface = "bold", position = ggplot2::position_stack(vjust = 0.5)
                ) +
                ggplot2::scale_fill_manual(values = question$color_scale) +
                ggplot2::scale_y_continuous(labels = scales::percent) +
                ggplot2::labs(y = "Átlagos válasz arány", fill = "Válasz", x = NULL) +
                ggplot2::theme_minimal() +
                ggplot2::theme(
                    legend.text = ggplot2::element_text(size = 12),
                    plot.background = ggplot2::element_rect(colour = NA, fill = NA, linewidth = 1),
                    axis.text = ggplot2::element_text(size = 12),
                    plot.margin = unit(c(2, 0, 2, 0), "cm")
                ),
            nrow = 1, widths = c(4, 2)
        )
    )
}
#' GGPlot template for multiple part-whole survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot or grid object
survey_ggplot_resz_egesz_multiple <- function(question) {
    gridExtra::grid.arrange(
        gridExtra::arrangeGrob(
            question$wrangled %>%
                ggplot2::ggplot(ggplot2::aes(x = answer)) +
                ggplot2::geom_histogram(ggplot2::aes(alpha = after_stat(count), fill = valasz_szovege), color = "black", bins = 7) +
                ggplot2::facet_wrap(~valasz_szovege, scales = "free") +
                ggplot2::scale_x_continuous(breaks = rflib::integer_breaks(), labels = scales::label_comma()) +
                ggplot2::scale_y_continuous(breaks = rflib::integer_breaks(), labels = scales::label_comma()) +
                ggplot2::scale_fill_manual(values = question$color_scale) +
                ggplot2::scale_alpha_continuous(range = c(0.45, 1)) +
                ggplot2::guides(alpha = "none", fill = "none") +
                ggplot2::labs(
                    x = "Válasz", fill = "Válasz", y = "Válaszok száma",
                    subtitle = question$group
                ) +
                ggplot2::theme_minimal() +
                ggplot2::theme(
                    strip.text = ggplot2::element_text(size = 14),
                    axis.text = ggplot2::element_text(size = 12),
                    axis.title = ggplot2::element_text(size = 14),
                    legend.title = ggplot2::element_text(size = 14),
                    plot.background = ggplot2::element_rect(colour = NA, fill = NA, linewidth = 1),
                    legend.text = ggplot2::element_text(size = 12),
                    plot.margin = unit(c(0, 2, 0, 2), "cm")
                ),
            question$wrangled %>%
                dplyr::select(kerdes, valasz_szovege, mean) %>%
                unique() %>%
                dplyr::mutate(
                    valasz_szovege = forcats::fct_reorder(valasz_szovege, mean)
                ) |>
                ggplot2::ggplot(ggplot2::aes(
                    y = valasz_szovege, x = mean,
                    fill = valasz_szovege,
                ), color = "black") +
                ggplot2::geom_col() +
                ggplot2::geom_text(
                    ggplot2::aes(
                        label =
                            ifelse(mean <= 0.1,
                                format(round(mean, 2), nsmall = 2),
                                format(round(mean, 1), nsmall = 1)
                            ),
                        # x = (mean + 0.25)*1.05),
                        x = mean
                    ),
                    hjust = "inward",
                    show.legend = F, size = 6,
                    fontface = "bold"
                ) +
                ggplot2::scale_fill_manual(values = question$color_scale) +
                ggplot2::guides(fill = ggplot2::guide_legend(ncol = 2, byrow = T, reverse = TRUE)) +
                ggplot2::labs(y = "Átlagos válaszok", fill = NULL, x = NULL) +
                ggplot2::theme_minimal() +
                ggplot2::theme(
                    legend.text = ggplot2::element_text(size = 8),
                    legend.position = "bottom",
                    legend.title = ggplot2::element_text(size = 14),
                    axis.text.x = ggplot2::element_text(size = 12),
                    axis.text.y = ggplot2::element_blank(),
                    panel.grid.major = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank()
                ),
            nrow = 1, widths = c(4, 2)
        )
    )
}
#' GGPlot template for Likert scale survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_likert_scale <- function(question) {
    ggplot2::ggplot(data = question$wrangled, ggplot2::aes(
        x = answer,
        y = valasz_szovege
    )) +
        ggplot2::geom_tile(ggplot2::aes(width = 1, alpha = alpha, fill = valasz_szovege),
            color = "black"
        ) +
        ggplot2::geom_text(ggplot2::aes(
            x = max(answer) + 1, label =
                str_c("Átlag: ", round(mean, 1))
        )) +
        ggplot2::geom_point(ggplot2::aes(x = mean, fill = valasz_szovege),
            color = "black", pch = 21, size = 8, show.legend = F
        ) +
        ggplot2::scale_alpha(
            range = c(0.1, 0.8),
            na.value = 0
        ) +
        ggplot2::scale_y_discrete(limits = rev) +
        ggplot2::scale_x_continuous(
            na.value = 0,
            limits = c(0, first(as.numeric(question$label$ig)) + 1.3),
            breaks = seq(1, first(as.numeric(question$label$ig))),
            labels = {
                if (!is.null(question$likert_labeller)) {
                    labels <- seq(1, first(as.numeric(question$label$ig)))
                    labels[1] <- question$likert_labeller$first_label
                    labels[length(labels)] <- question$likert_labeller$last_label
                    stringr::str_wrap(labels, 20)
                } else {
                    stringr::str_wrap(
                        seq(1, first(as.numeric(question$label$ig))),
                        20
                    )
                }
            }
        ) +
        ggplot2::guides(color = "none", alpha = "none", fill = "none") +
        ggplot2::theme_minimal() +
        ggplot2::theme(
            axis.text.x = ggplot2::element_text(size = 9),
            axis.text.y = ggplot2::element_text(size = 12),
            panel.grid = ggplot2::element_blank(),
            axis.title = ggplot2::element_text(size = 14),
            legend.title = ggplot2::element_text(size = 14),
            legend.text = ggplot2::element_text(size = 12),
            plot.subtitle = ggplot2::element_text(size = 18),
            plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1)
        ) +
        ggplot2::scale_color_manual(values = question$color_scale) +
        ggplot2::scale_fill_manual(values = question$color_scale) +
        ggplot2::labs(
            x = NULL, y = NULL,
            size = "Válaszadók száma",
            subtitle = question$group
        )
}
#' GGPlot template for column distribution (total) survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_col_eloszlas_total <- function(question) {
    question$wrangled %>%
        ggplot2::ggplot(ggplot2::aes(x = percentage, y = "", fill = valasz_szovege)) +
        ggplot2::geom_col(position = ggplot2::position_stack(), color = "black") +
        ggplot2::geom_text(ggplot2::aes(label = count),
            size = 6, position = ggplot2::position_stack(vjust = 0.5),
            fontface = "bold", color = "black"
        ) +
        ggplot2::scale_x_continuous(labels = scales::percent) +
        ggplot2::guides(fill = ggplot2::guide_legend(
            nrow = 2,
            reverse = T
        )) +
        ggplot2::scale_fill_manual(values = question$color_scale) +
        ggplot2::labs(
            x = "Válaszok aránya", y = NULL, fill = NULL,
            subtitle = question$group
        ) +
        ggplot2::theme_minimal() +
        ggplot2::theme(
            plot.subtitle = ggplot2::element_text(size = 16),
            legend.position = "bottom",
            legend.direction = "horizontal",
            plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1)
        )
}
#' GGPlot template for column distribution (multiple) survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_col_eloszlas_multiple <- function(question) {
    question$wrangled %>%
        dplyr::arrange(kerdesbetu) %>%
        dplyr::mutate(
            valasz_szovege =
                (stringr::str_wrap(valasz_szovege, 30))
        ) %>%
        dplyr::mutate(valasz_szovege = forcats::fct_inorder(valasz_szovege)) |>
        ggplot2::ggplot(ggplot2::aes(x = percentage, y = valasz_szovege, fill = valasz_szovege)) +
        ggplot2::geom_col(position = ggplot2::position_stack(), color = "black") +
        ggplot2::geom_col(alpha = 0.3, ggplot2::aes(x = 1)) +
        ggplot2::geom_text(
            ggplot2::aes(
                label =
                    ifelse(percentage <= 0.02,
                        "",
                        scales::number(count, accuracy = 1L)
                    )
            ),
            size = 4.5, position = ggplot2::position_stack(vjust = 0.5),
            fontface = "bold", color = "black"
        ) +
        ggplot2::scale_x_continuous(labels = scales::percent) +
        ggplot2::scale_y_discrete(limits = rev) +
        ggplot2::scale_fill_manual(values = question$color_scale) +
        ggplot2::guides(fill = "none") +
        ggplot2::labs(
            x = "Válaszok aránya", y = NULL, fill = "",
            subtitle = question$group
        ) +
        ggplot2::theme_minimal() +
        ggplot2::theme(
            plot.subtitle = ggplot2::element_text(size = 16),
            plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1)
        )
}
#' GGPlot template for year distribution (unscaled) survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_year_eloszlas_unscale <- function(question) {
    bin_limit <- 15

    kozepertek <-
        question$wrangled %>%
        dplyr::select(respondent_id, answer) %>%
        unique() %>%
        tidyr::drop_na(answer) |>
        dplyr::mutate(
            mean = mean(answer, na.rm = T),
            median = median(answer, na.rm = T)
        ) %>%
        tidyr::pivot_longer(3:4, names_to = "kozepertek", values_to = "med_value") %>%
        dplyr::mutate(
            string =
                purrr::map2_chr(
                    kozepertek, med_value,
                    ~ dplyr::case_when(
                        (.x == "mean") & (.y >= 1000) ~
                            stringr::str_c("Átlag: ", round(.y, digits = 0)),
                        !(.x == "mean") & (.y >= 1000) ~
                            stringr::str_c("Medián: ", round(.y, digits = 0)),
                        (.x == "mean") & !(.y >= 1000) ~
                            stringr::str_c("Átlag: ", round(.y, digits = 1)),
                        !(.x == "mean") & !(.y >= 1000) ~
                            stringr::str_c("Medián: ", round(.y, digits = 1)),
                    )
                )
        )


    question$wrangled %>%
        dplyr::select(respondent_id, answer) %>%
        unique() %>%
        tidyr::drop_na(answer) %>%
        {
            ggplot2::ggplot(data = ., ggplot2::aes(x = answer)) +
                {
                    if (length(unique(.$answer)) > bin_limit) {
                        ggplot2::stat_bin(bins = bin_limit, fill = rflib::long_palette()[2], alpha = 0.8, color = "black")
                    } else {
                        ggplot2::stat_bin(
                            bins = length(unique(.$answer)),
                            fill = rflib::long_palette()[2], alpha = 0.8, color = "black",
                            binwidth = 0.75,
                            boundary = 0.5,
                        )
                    }
                } +
                ggplot2::scale_y_continuous(
                    breaks = rflib::integer_breaks(),
                    labels = scales::label_comma(
                        big.mark = "",
                        decimal.mark = ","
                    )
                ) +
                ggplot2::scale_x_continuous(
                    breaks = rflib::integer_breaks(),
                    # limits = c(0, NA),
                    labels = scales::label_comma(
                        big.mark = "",
                        decimal.mark = ","
                    )
                ) +
                ggplot2::geom_vline(
                    data = kozepertek, ggplot2::aes(xintercept = med_value, color = string),
                    linetype = "dashed", size = 1
                ) +
                ggplot2::scale_color_manual(values = c(
                    rflib::long_palette()[7],
                    rflib::long_palette()[4]
                )) +
                ggplot2::theme_minimal() +
                ggplot2::theme(
                    axis.title = ggplot2::element_text(size = 14),
                    axis.text = ggplot2::element_text(size = 12),
                    legend.text = ggplot2::element_text(size = 12),
                    legend.title = ggplot2::element_text(size = 14),
                    plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1)
                ) +
                ggplot2::labs(
                    x = "Érték", y = "Válaszok száma", color = "Középértékek",
                    subtitle = question$caption
                )
        }
}
#' GGPlot template for year distribution survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_year_eloszlas <- function(question) {
    bin_limit <- 15

    kozepertek <-
        question$wrangled %>%
        dplyr::select(respondent_id, answer) %>%
        unique() %>%
        tidyr::drop_na(answer) |>
        dplyr::mutate(
            mean = mean(answer, na.rm = T),
            median = median(answer, na.rm = T)
        ) %>%
        tidyr::pivot_longer(3:4, names_to = "kozepertek", values_to = "med_value") %>%
        dplyr::mutate(
            string =
                purrr::map2_chr(
                    kozepertek, med_value,
                    ~ dplyr::case_when(
                        (.x == "mean") & (.y >= 1000) ~
                            stringr::str_c("Átlag: ", round(.y, digits = 0)),
                        !(.x == "mean") & (.y >= 1000) ~
                            stringr::str_c("Medián: ", round(.y, digits = 0)),
                        (.x == "mean") & !(.y >= 1000) ~
                            stringr::str_c("Átlag: ", round(.y, digits = 1)),
                        !(.x == "mean") & !(.y >= 1000) ~
                            stringr::str_c("Medián: ", round(.y, digits = 1)),
                    )
                )
        )


    question$wrangled %>%
        dplyr::select(respondent_id, answer) %>%
        unique() %>%
        tidyr::drop_na(answer) %>%
        {
            ggplot2::ggplot(data = ., ggplot2::aes(x = answer)) +
                {
                    if (length(unique(.$answer)) > bin_limit) {
                        ggplot2::stat_bin(bins = bin_limit, fill = rflib::long_palette()[2], alpha = 0.8, color = "black")
                    } else {
                        ggplot2::stat_bin(
                            bins = length(unique(.$answer)),
                            fill = rflib::long_palette()[2], alpha = 0.8, color = "black",
                            binwidth = 0.75,
                            boundary = 0.5,
                        )
                    }
                } +
                ggplot2::scale_y_continuous(
                    breaks = rflib::integer_breaks(),
                    labels = scales::label_comma(
                        big.mark = "",
                        decimal.mark = ","
                    )
                ) +
                ggplot2::scale_x_continuous(
                    breaks = rflib::integer_breaks(),
                    labels = scales::label_comma(
                        big.mark = "",
                        decimal.mark = ","
                    )
                ) +
                ggplot2::geom_vline(
                    data = kozepertek, ggplot2::aes(xintercept = med_value, color = string),
                    linetype = "dashed", size = 1
                ) +
                ggplot2::scale_color_manual(values = c(
                    rflib::long_palette()[7],
                    rflib::long_palette()[4]
                )) +
                ggplot2::expand_limits(x = 0) +
                ggplot2::theme_minimal() +
                ggplot2::theme(
                    axis.title = ggplot2::element_text(size = 14),
                    axis.text = ggplot2::element_text(size = 12),
                    legend.text = ggplot2::element_text(size = 12),
                    legend.title = ggplot2::element_text(size = 14),
                    plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1)
                ) +
                ggplot2::labs(
                    x = "Érték", y = "Válaszok száma", color = "Középértékek",
                    subtitle = question$caption
                )
        }
}
#' GGPlot template for table survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_table <- function(question) {
    question$wrangled %>%
        ggplot2::ggplot(ggplot2::aes(x = valasz_szovege, y = oszlop_szovege, fill = perc)) +
        ggplot2::geom_tile(color = "black") +
        ggplot2::geom_text(ggplot2::aes(
            label =
                scales::percent(perc, accuracy = 0.1)
        ), size = 6) +
        ggplot2::theme_minimal() +
        ggplot2::theme(
            axis.text.x = ggplot2::element_text(angle = 45, size = 9, vjust = 1, hjust = 1),
            axis.text.y = ggplot2::element_text(size = 9),
            panel.grid = ggplot2::element_blank(),
            axis.title = ggplot2::element_text(size = 14),
            legend.title = ggplot2::element_text(size = 14),
            legend.text = ggplot2::element_text(size = 12),
            plot.subtitle = ggplot2::element_text(size = 18),
            plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1),
        ) +
        ggplot2::scale_y_discrete(limits = rev) +
        ggplot2::scale_fill_gradient2(
            labels = scales::percent,
            mid = "#FFFAFA",
            high = rflib::long_palette()[2],
            na.value = alpha(rflib::long_palette()[3], 0.35)
        ) +
        ggplot2::labs(
            x = NULL, y = NULL, fill = "Válaszok száma",
            subtitle = question$group
        )
}
#' GGPlot template for text bubble multiple survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @importFrom ggwordcloud geom_text_wordcloud
#' @return A ggplot object
survey_ggplot_szoveg_buborek_multiple <- function(question) {
    question$wrangled |>
        ggplot2::ggplot(ggplot2::aes(label = str_wrap(str_c(
            "\"", answer, "\""
        ), 50))) +
        ggwordcloud::geom_text_wordcloud(
            ggplot2::aes(
                color = valasz_szovege,
                size = log(count)
            ),
            rm_outside = T
        ) +
        ggplot2::facet_wrap(~total_szoveg) +
        ggplot2::scale_color_manual(values = question$color_scale) +
        ggplot2::scale_size(range = c(3, 6)) +
        ggplot2::theme_minimal() +
        ggplot2::theme(
            strip.text.x = ggplot2::element_text(size = 10),
            plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1)
        ) +
        ggplot2::guides(color = "none") +
        ggplot2::labs(
            caption = "A válaszok nagysága arányos az említéseik számával\n Csak a kettőnél többször említett válaszok vannak megjelenítve",
            subtitle = question$group
        )
}

#' GGPlot template for region distribution survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @importFrom sf st_as_sf
#' @return A ggplot object
survey_ggplot_regio_eloszlas <- function(question) {
    question$wrangled |>
        right_join(regio_shape,
            by = join_by("regio_nev" == "NUTS_NAME")
        ) |>
        sf::st_as_sf() %>%
        # left_join(, regio_geodata) %>%
        ggplot(aes(fill = percentage, geometry = geometry)) +
        geom_sf(color = "black") +
        geom_sf_text(aes(label = count), size = 6, fontface = "bold") +
        scale_fill_gradient2(
            mid = "snow",
            high = long_palette()[2],
            na.value = long_palette()[3],
            labels = scales::percent,
            guide = guide_colorbar(
                frame.colour = "black"
            )
        ) +
        theme(
            axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            panel.grid = element_blank(),
            # axis.title = element_text(size = 14),
            # axis.text = element_text(size = 12),
            legend.title = element_text(size = 14),
            legend.text = element_text(size = 12),
            plot.background = element_rect(colour = "black", fill = NA, linewidth = 1),
            plot.subtitle = element_text(size = 18)
        ) +
        labs(
            fill = "Válaszok aránya",
            # title = title_to_plot,
            subtitle = question$group,
            x = NULL, y = NULL
        )
}
#' GGPlot template for other text column survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_szoveg_col_egyeb <- function(question) {
    # TODO: fill in ggplot code
}

#' GGPlot template for table average survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_table_atlag <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for reversed Likert scale survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_likert_scale_rev <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for new other text column survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_szoveg_col_egyeb_new <- function(question) {
    # TODO: fill in ggplot code
}

#' GGPlot template for heatmap survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_hoterkep <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for area distribution survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_terulet_eloszlas <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for Likert scale table survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_likert_scale_table <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for Likert scale reference survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_likert_scale_ref <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for table row survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_table_sor <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for table reversed survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_table_rev <- function(question) {
    question$wrangled %>%
        ggplot2::ggplot(ggplot2::aes(y = valasz_szovege, x = oszlop_szovege, fill = perc)) +
        ggplot2::geom_tile(color = "black") +
        ggplot2::geom_text(ggplot2::aes(
            label =
                scales::percent(perc, accuracy = 0.1)
        ), size = 6) +
        ggplot2::theme_minimal() +
        ggplot2::theme(
            axis.text.x = ggplot2::element_text(angle = 45, size = 9, vjust = 1, hjust = 1),
            axis.text.y = ggplot2::element_text(size = 9),
            panel.grid = ggplot2::element_blank(),
            axis.title = ggplot2::element_text(size = 14),
            legend.title = ggplot2::element_text(size = 14),
            legend.text = ggplot2::element_text(size = 12),
            plot.subtitle = ggplot2::element_text(size = 18),
            plot.background = ggplot2::element_rect(colour = "black", fill = NA, linewidth = 1),
        ) +
        ggplot2::scale_y_discrete(limits = rev) +
        ggplot2::scale_fill_gradient2(
            labels = scales::percent,
            mid = "#FFFAFA",
            high = rflib::long_palette()[2],
            na.value = alpha(rflib::long_palette()[3], 0.35)
        ) +
        ggplot2::labs(
            x = NULL, y = NULL, fill = "Válaszok száma",
            subtitle = question$group
        )
}
#' GGPlot template for other numeric column survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_szam_col_egyeb <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for column distribution survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_col_eloszlas <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for table column survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_table_oszlop <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for discrete distribution survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_diszkret_eloszlas <- function(question) {
    # TODO: fill in ggplot code
}
#' GGPlot template for other table survey question
#'
#' @param question A list containing wrangled data and plot parameters
#' @return A ggplot object
survey_ggplot_table_egyeb <- function(question) {
    # TODO: fill in ggplot code
}
