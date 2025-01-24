#' @title Validate Required Column
#' @param data A data frame to validate.
#' @param required_columns A vector of column names that must be present in the data frame.
#' @return None. Stops with an error if required columns are missing.
#'
#' @export

validate_columns <- function(data, required_columns) {
  missing_columns <- setdiff(required_columns, colnames(data))
  if (length(missing_columns) > 0) {
    stop("The following required columns are missing: ", paste(missing_columns, collapse = ", "))
  }
}

#' Generate Plot 1
generate_plot1 <- function(data, x_felirat, caption_to_plot, is_limited, is_oszlop) {
  ggplot(data, aes(x = value)) +
    geom_histogram(aes(alpha = ..count.., fill = valasz_szovege), color = "black", bins = 7) +
    {if (is_limited) facet_wrap(~NiceName(valasz_szovege), scales = "free_y") else facet_wrap(~NiceName(valasz_szovege), scales = "free")} +
    scale_x_continuous(breaks = integer_breaks(), labels = scales::label_comma()) +
    scale_y_continuous(breaks = integer_breaks(), labels = scales::label_comma()) +
    labs(
      x = x_felirat,
      fill = "Válasz",
      y = "Válaszok száma",
      subtitle = caption_to_plot
    ) +
    theme_minimal() +
    scale_fill_jco() +
    scale_alpha_continuous(range = c(0.45, 1)) +
    guides(alpha = "none", fill = "none")
}

#' Generate Plot 2
generate_plot2 <- function(data, fill_felirat) {
  ggplot(data, aes(y = kerdes, x = value, fill = NiceName(valasz_szovege))) +
    geom_col(color = "black") +
    geom_text(aes(
      label = ifelse(value <= 0.1,
                     format(round(value, 2), nsmall = 2),
                     format(round(value, 1), nsmall = 1)),
      x = value
    ), hjust = "inward", show.legend = FALSE, size = 6, fontface = "bold") +
    scale_fill_manual(values = labels) +
    facet_wrap(~NiceName(name), ncol = 1) +
    guides(fill = guide_legend(ncol = 3)) +
    labs(
      y = "Válaszok középértékei",
      fill = fill_felirat,
      x = NULL
    ) +
    theme_minimal()
}

#' Create Discrete Eloszlas Plot
create_discrete_eloszlas_plot <- function(
  data_to_plot,
  title_to_plot,
  caption_to_plot,
  plot_params = list(
    x_felirat = "X-axis",
    fill_felirat = "Fill Legend",
    fig.height = 6,
    fig.width = 13
  )
) {
  validate_columns(data_to_plot, c("value", "valasz_szovege", "kerdes", "mean", "median"))

  x_felirat <- plot_params$x_felirat
  fill_felirat <- plot_params$fill_felirat

  is_limited <- !is.na(dplyr::first(data_to_plot$ig))
  is_oszlop <- length(unique(data_to_plot$oszlop_szovege)) > 1

  plot1 <- generate_plot1(data_to_plot, x_felirat, caption_to_plot, is_limited, is_oszlop)
  plot2 <- generate_plot2(data_to_plot, fill_felirat)

  combined_plot <- patchwork::wrap_plots(plot1, plot2, nrow = 1, widths = c(4, 2))
  attr(combined_plot, "fig.height") <- plot_params$fig.height
  attr(combined_plot, "fig.width") <- plot_params$fig.width

  return(combined_plot)
}

#' Create Plot
create_plot <- function(
  plot_type,
  data_to_plot,
  title_to_plot,
  caption_to_plot,
  plot_params = list(
    x_felirat = "X-axis",
    fill_felirat = "Fill Legend",
    fig.height = 6,
    fig.width = 13
  )
) {
  plot_functions <- list(
    discrete_eloszlas = create_discrete_eloszlas_plot
  )

  if (!plot_type %in% names(plot_functions)) {
    stop("Invalid plot type. Available types are: ", paste(names(plot_functions), collapse = ", "))
  }

  plot_function <- plot_functions[[plot_type]]
  plot <- plot_function(
    data_to_plot = data_to_plot,
    title_to_plot = title_to_plot,
    caption_to_plot = caption_to_plot,
    plot_params = plot_params
  )

  return(plot)
}
