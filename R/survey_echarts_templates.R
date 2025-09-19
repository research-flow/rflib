# ECharts template functions for survey question types
# Fill in each function with the appropriate ECharts code for the wrangled data
# Each function includes a placeholder for overarching elements (e.g., base options)

#' @importFrom echarts4r e_common

echarts4r::e_common(font_family = "helvetica", theme = "westeros")

#' @title ECharts template for total part-whole survey question
#' @description Creates a bar chart for total part-whole survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_bar e_add_nested e_y_axis e_flip_coords e_tooltip e_legend

survey_echarts_resz_egesz_total <- function(question) {
  question$wrangled %>%
    dplyr::distinct(kerdes, valasz_szovege, mean, mean_perc) %>%
    dplyr::mutate(
      x = "",
      color = question$color_scale[valasz_szovege],
      mean_perc = round(mean_perc * 100, 2)
    ) %>%
    echarts4r::e_charts(x = valasz_szovege) %>%
    echarts4r::e_bar(mean_perc,
      stack = "grp",
      name = "Átlagos válasz arány (%)",
      label = list(
        show = TRUE, position = "inside"
      ),
    ) %>%
    echarts4r::e_legend(show = FALSE) %>%
    echarts4r::e_add_nested("itemStyle", color) %>%
    echarts4r::e_y_axis(
      name = "Átlagos válasz arány (%)",
      formatter = htmlwidgets::JS("value => value + '%'"),
      nameLocation = "middle", nameGap = 30
    ) %>%
    echarts4r::e_flip_coords() %>%
    echarts4r::e_tooltip() %>%
    echarts4r::e_y_axis(inverse = TRUE)
}
#' @title ECharts template for multiple part-whole survey question
#' @description Creates a bar chart for multiple part-whole survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_bar e_add_nested e_axis_stagger e_y_axis e_flip_coords e_tooltip e_legend

survey_echarts_resz_egesz_multiple <- function(question) {
  question$wrangled %>%
    dplyr::distinct(kerdes, valasz_szovege, mean) %>%
    dplyr::mutate(
      color = question$color_scale[valasz_szovege],
      mean = round(mean, 2)
    ) |>
    dplyr::arrange(mean) %>%
    echarts4r::e_charts(valasz_szovege, reorder = FALSE) %>%
    echarts4r::e_bar(mean,
      name = "Átlagos válasz arány (%)",
      label = list(
        show = TRUE, position = "right"
      ),
    ) %>%
    echarts4r::e_add_nested("itemStyle", color) %>%
    echarts4r::e_axis_stagger() %>%
    echarts4r::e_y_axis(
      name = "Átlagos válasz arány (%)",
      formatter = htmlwidgets::JS("value => value + '%'"),
      nameLocation = "middle", nameGap = 30
    ) %>%
    echarts4r::e_flip_coords() %>%
    echarts4r::e_tooltip() %>%
    echarts4r::e_legend(show = FALSE)
}
#' @title ECharts template for Likert scale survey question
#' @description Creates a bar and scatter chart for Likert scale survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_bar e_scatter e_add_nested e_x_axis e_flip_coords e_legend

survey_echarts_likert_scale <- function(question) {
  # Handle missing likert_labeller gracefully
  if (is.null(question$likert_labeller)) {
    # Set identity function if likert_labeller is missing
    question$likert_labeller <- function(x) x
  }

  # Apply labeller function if it's a function, otherwise use data as is
  if (is.function(question$likert_labeller)) {
    question$data <- question$likert_labeller(question$data)
  } else {
    # If likert_labeller is not a function, try to use likert_labeller function from wrangle_functions
    question$data <- tryCatch(
      likert_labeller(question$data, question$likert_labeller),
      error = function(e) question$data # Use original data if labelling fails
    )
  }

  question$wrangled %>%
    dplyr::mutate(
      value_mod = 1,
      color = alpha(question$color_scale[valasz_szovege], alpha)
    ) |>
    dplyr::group_by(answer) |>
    echarts4r::e_charts(valasz_szovege) |>
    echarts4r::e_bar(value_mod,
      stack = "grp",
      itemStyle = list(borderColor = "black"),
      bind = count
    ) |>
    echarts4r::e_scatter(mean,
      symbol_size = 10, color = "black",
      label = list(
        show = TRUE,
        position = "right",
        formatter =
          htmlwidgets::JS("
      function(params){
        return(Number(params.value[0]).toFixed(2))
      }
    ")
      )
    ) |>
    echarts4r::e_add_nested("itemStyle", color) |>
    echarts4r::e_x_axis(inverse = TRUE) |>
    echarts4r::e_flip_coords() |>
    echarts4r::e_tooltip(
      formatter = htmlwidgets::JS("
        function(params) {
          var result = '<div style=\"padding: 10px; font-size: 14px;\">';

          if (params.componentType === 'series') {
            if (params.seriesType === 'bar') {
              // For bar charts (stacked bars)
              var answer = params.seriesName;
              var category = params.name;

              result += '<strong>' + answer + '</strong> - N =' + category + '<br/>'

            }
          }

          result += '</div>';
          return result;
        }
      ")
    ) |>
    echarts4r::e_legend(show = FALSE)
}

#' @title ECharts template for column distribution (total) survey question
#' @description Creates a bar chart for column distribution (total) survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_bar e_add_nested e_x_axis e_y_axis e_flip_coords e_legend

survey_echarts_col_eloszlas_total <- function(question) {
  question$wrangled |>
    dplyr::mutate(
      color = question$color_scale[valasz_szovege],
      percentage = round(percentage * 100, 2)
    ) |>
    echarts4r::e_charts(valasz_szovege, reorder = FALSE) |>
    echarts4r::e_bar(percentage,
      bind = count,
      stack = "grp",
      name = "Válaszok darabszáma",
      label = list(
        show = TRUE, position = "right",
        formatter = "{b}"
      )
    ) |>
    echarts4r::e_add_nested("itemStyle", color) |>
    echarts4r::e_x_axis(inverse = TRUE) |>
    echarts4r::e_y_axis(
      name = "Válaszok aránya (%)",
      formatter = htmlwidgets::JS("value => value + '%'"),
      nameLocation = "middle", nameGap = 30
    ) |>
    echarts4r::e_flip_coords() |>
    echarts4r::e_legend(show = FALSE)
}
#' @title ECharts template for column distribution (multiple) survey question
#' @description Creates a bar chart for column distribution (multiple) survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_bar e_add_nested e_x_axis e_y_axis e_flip_coords e_legend

survey_echarts_col_eloszlas_multiple <- function(question) {
  question$wrangled |>
    dplyr::mutate(
      color = question$color_scale[valasz_szovege],
      percentage = round(percentage * 100, 2)
    ) |>
    echarts4r::e_charts(valasz_szovege, reorder = FALSE) |>
    echarts4r::e_bar(percentage,
      bind = count,
      stack = "grp",
      name = "Válaszok darabszáma",
      label = list(
        show = TRUE, position = "right",
        formatter = "{b}"
      )
    ) |>
    echarts4r::e_add_nested("itemStyle", color) |>
    echarts4r::e_x_axis(inverse = TRUE) |>
    echarts4r::e_y_axis(
      name = "Válaszok aránya (%)",
      formatter = htmlwidgets::JS("value => value + '%'"),
      nameLocation = "middle", nameGap = 30
    ) |>
    echarts4r::e_flip_coords() |>
    echarts4r::e_legend(show = FALSE)
}
#' @title ECharts template for year distribution (unscaled) survey question
#' @description Creates a histogram for year distribution (unscaled) survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_histogram e_color e_y_axis e_legend e_mark_line

survey_echarts_year_eloszlas_unscale <- function(question) {
  avg <- mean(question$wrangled$answer, na.rm = TRUE)
  med <- median(question$wrangled$answer, na.rm = TRUE)

  n <- min(nrow(question$wrangled) - 1, 15)

  question$wrangled |>
    echarts4r::e_charts() |>
    echarts4r::e_histogram(answer,
      name = "Közép", breaks = n
    ) |>
    echarts4r::e_color(alpha(rflib::long_palette()[3], 0.4)) |>
    echarts4r::e_y_axis(
      name = "Válaszok száma"
    ) |>
    echarts4r::e_legend(show = FALSE) |>
    echarts4r::e_mark_line(
      data = list(xAxis = avg),
      lineStyle = list(color = rflib::long_palette()[8]),
      # lineStyle = list(color = rflib::long_palette()[4]),
      symbol = "none",
      title = stringr::str_c("Átlag: ", scales::number(avg, accuracy = 0.1)),
      title_position = "middle"
    ) |>
    echarts4r::e_mark_line(
      data = list(xAxis = med),
      # symbol = "none",
      lineStyle = list(color = rflib::long_palette()[4]),
      title = stringr::str_c("Medián: ", scales::number(med, accuracy = 0.1)),
      title_position = "end"
    ) |>
    echarts4r::e_tooltip()
}
#' @title ECharts template for year distribution survey question
#' @description Creates a histogram for year distribution survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_histogram e_color e_y_axis e_x_axis e_legend e_mark_line

survey_echarts_year_eloszlas <- function(question) {
  avg <- mean(question$wrangled$answer, na.rm = TRUE)
  med <- median(question$wrangled$answer, na.rm = TRUE)
  n <- min(nrow(question$wrangled) - 1, 15)
  question$wrangled |>
    echarts4r::e_charts() |>
    echarts4r::e_histogram(answer,
      name = "Közép", breaks = n
    ) |>
    echarts4r::e_color(alpha(rflib::long_palette()[3], 0.4)) |>
    echarts4r::e_y_axis(
      name = "Válaszok száma"
    ) |>
    echarts4r::e_x_axis(
      min = 0
    ) |>
    echarts4r::e_legend(show = FALSE) |>
    echarts4r::e_mark_line(
      data = list(xAxis = avg),
      symbol = "none",
      title = stringr::str_c("Átlag: ", scales::number(avg, accuracy = 0.1)),
      title_position = "end"
    ) |>
    echarts4r::e_mark_line(
      data = list(xAxis = med),
      symbol = "none",
      title = stringr::str_c("Medián: ", scales::number(med, accuracy = 0.1)),
      title_position = "end"
    ) |>
    echarts4r::e_tooltip()
}
#' @title ECharts template for table survey question
#' @description Creates a heatmap for table survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_heatmap e_visual_map e_tooltip

survey_echarts_table <- function(question) {
  question$wrangled |>
    dplyr::mutate(perc = round(perc * 100, 1)) |>
    echarts4r::e_charts(valasz_szovege) |>
    echarts4r::e_heatmap(oszlop_szovege, perc,
      itemStyle = list(emphasis = list(shadowBlur = 3)),
      label = list(
        show = TRUE,
        formatter = htmlwidgets::JS("
      function(params){
      return(params.value[2] + '%')
      }
    ")
      )
    ) |>
    echarts4r::e_visual_map(perc,
      inRange = list(
        color = c("#FFFAFA", rflib::long_palette()[2])
      ),
      formatter = htmlwidgets::JS("value => value + '%'"),
      show = FALSE
    ) |>
    echarts4r::e_y_axis(inverse = TRUE) |>
    echarts4r::e_tooltip(
      formatter = htmlwidgets::JS("
        function(params) {
          var columnName = params.name;
          var rowName = params.value[params.encode.y[0]];
          var value = params.value[2];

          return '<div style=\"padding: 10px; font-size: 14px;\">' +
                 rowName + ' - ' +
                 columnName + '<br/>' +
                 value + '%' +
                 '</div>';
        }
      ")
    )
}

#' @title ECharts template for text bubble multiple survey question
#' @description Creates a word cloud for text bubble multiple survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts e_cloud e_title e_arrange

survey_echarts_szoveg_buborek_multiple <- function(question) {
  question$wrangled |>
    tidyr::drop_na(answer) |>
    dplyr::mutate(
      answer_label = stringr::str_wrap(stringr::str_c(
        "\"", answer, "\""
      ), 50),
      color = question$color_scale[valasz_szovege],
      size = log(count)
    ) |>
    dplyr::arrange(kerdesbetu) |>
    dplyr::group_split(valasz_szovege) %>%
    {
      # Calculate dynamic grid dimensions
      n_groups <- length(.)
      n_cols <- max(3, ceiling(sqrt(n_groups))) # minimum 3 cols
      n_rows <- min(3, ceiling(n_groups / n_cols)) # maximum 3 rows

      # Create the charts
      chart_list <- purrr::imap(., function(j, k) {
        j %>%
          echarts4r::e_charts(name = paste0("chart_", k)) |>
          echarts4r::e_cloud(answer_label, size, color,
            shrinkToFit = TRUE,
            sizeRange = list(5, 15),
            rotationRange = list(0, 0),
            rotationStep = 10,
            shape = "diamond"
          ) |>
          echarts4r::e_title(subtext = first(j$valasz_szovege))
      })

      # Append grid dimensions and arrange
      chart_list %>%
        append(c(rows = n_rows, cols = n_cols)) %>%
        do.call(echarts4r::e_arrange, .)
    }
}







#' @title ECharts template for region distribution survey question
#' @description Creates a region distribution plot for survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_regio_eloszlas <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for other text column survey question
#' @description Creates a plot for other text column survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_szoveg_col_egyeb <- function(question) {
  # TODO: fill in ECharts code
}

#' @title ECharts template for table average survey question
#' @description Creates a plot for table average survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_table_atlag <- function(question) {
  question$wrangled |>
    dplyr::mutate(mean = round(mean, 2)) |>
    echarts4r::e_charts(valasz_szovege) |>
    echarts4r::e_heatmap(oszlop_szovege, mean,
      itemStyle = list(emphasis = list(shadowBlur = 3)),
      label = list(
        show = TRUE,
        formatter = htmlwidgets::JS("
      function(params){
      return(params.value[2])
      }
    ")
      )
    ) |>
    echarts4r::e_visual_map(mean,
      inRange = list(
        color = c("#FFFAFA", rflib::long_palette()[2])
      ),
      formatter = htmlwidgets::JS("value => value"),
      show = FALSE
    ) |>
    echarts4r::e_y_axis(inverse = TRUE) |>
    echarts4r::e_tooltip(
      formatter = htmlwidgets::JS("
        function(params) {
          var columnName = params.name;
          var rowName = params.value[params.encode.y[0]];
          var value = params.value[2];

          return '<div style=\"padding: 10px; font-size: 14px;\">' +
                 rowName + ' - ' +
                 columnName + '<br/>' +
                 value +
                 '</div>';
        }
      ")
    )
}
#' @title ECharts template for reversed Likert scale survey question
#' @description Creates a plot for reversed Likert scale survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_likert_scale_rev <- function(question) {
  # Handle missing likert_labeller gracefully
  if (is.null(question$likert_labeller)) {
    # Set identity function if likert_labeller is missing
    question$likert_labeller <- function(x) x
  }

  # Apply labeller function if it's a function, otherwise use data as is
  if (is.function(question$likert_labeller)) {
    question$data <- question$likert_labeller(question$data)
  } else {
    # If likert_labeller is not a function, try to use likert_labeller function from wrangle_functions
    question$data <- tryCatch(
      likert_labeller(question$data, question$likert_labeller),
      error = function(e) question$data # Use original data if labelling fails
    )
  }

  question$wrangled %>%
    dplyr::mutate(
      value_mod = 1,
      color = alpha(question$color_scale[valasz_szovege], alpha)
    ) |>
    dplyr::group_by(answer) |>
    echarts4r::e_charts(valasz_szovege) |>
    echarts4r::e_bar(value_mod,
      stack = "grp",
      itemStyle = list(borderColor = "black"),
      bind = count
    ) |>
    echarts4r::e_scatter(mean,
      symbol_size = 10, color = "black",
      label = list(
        show = TRUE,
        position = "right",
        formatter =
          htmlwidgets::JS("
      function(params){
        return(Number(params.value[0]).toFixed(2))
      }
    ")
      )
    ) |>
    echarts4r::e_add_nested("itemStyle", color) |>
    echarts4r::e_x_axis(inverse = TRUE) |>
    echarts4r::e_flip_coords() |>
    echarts4r::e_tooltip(
      formatter = htmlwidgets::JS("
        function(params) {
          var result = '<div style=\"padding: 10px; font-size: 14px;\">';

          if (params.componentType === 'series') {
            if (params.seriesType === 'bar') {
              // For bar charts (stacked bars)
              var answer = params.seriesName;
              var category = params.name;

              result += '<strong>' + answer + '</strong> - N =' + category + '<br/>'

            }
          }

          result += '</div>';
          return result;
        }
      ")
    ) |>
    echarts4r::e_legend(show = FALSE)
}
#' @title ECharts template for new other text column survey question
#' @description Creates a plot for new other text column survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_szoveg_col_egyeb_new <- function(question) {
  # TODO: fill in ECharts code
}

#' @title ECharts template for heatmap survey question
#' @description Creates a heatmap for survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_hoterkep <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for area distribution survey question
#' @description Creates a plot for area distribution survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_terulet_eloszlas <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for Likert scale table survey question
#' @description Creates a plot for Likert scale table survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_likert_scale_table <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for Likert scale reference survey question
#' @description Creates a plot for Likert scale reference survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_likert_scale_ref <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for table row survey question
#' @description Creates a plot for table row survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_table_sor <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for table reversed survey question
#' @description Creates a plot for table reversed survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_table_rev <- function(question) {
  question$wrangled |>
    dplyr::mutate(perc = round(perc * 100, 1)) |>
    echarts4r::e_charts(oszlop_szovege) |>
    echarts4r::e_heatmap(valasz_szovege, perc,
      itemStyle = list(emphasis = list(shadowBlur = 3)),
      label = list(
        show = TRUE,
        formatter = htmlwidgets::JS("
      function(params){
      return(params.value[2] + '%')
      }
    ")
      )
    ) |>
    echarts4r::e_visual_map(perc,
      inRange = list(
        color = c("#FFFAFA", rflib::long_palette()[2])
      ),
      formatter = htmlwidgets::JS("value => value + '%'"),
      show = FALSE
    ) |>
    echarts4r::e_y_axis(inverse = TRUE) |>
    echarts4r::e_tooltip(
      formatter = htmlwidgets::JS("
        function(params) {
          var columnName = params.name;
          var rowName = params.value[params.encode.y[0]];
          var value = params.value[2];

          return '<div style=\"padding: 10px; font-size: 14px;\">' +
                 rowName + ' - ' +
                 columnName + '<br/>' +
                 value + '%' +
                 '</div>';
        }
      ")
    )
}
#' @title ECharts template for other numeric column survey question
#' @description Creates a plot for other numeric column survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_szam_col_egyeb <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for column distribution survey question
#' @description Creates a plot for column distribution survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_col_eloszlas <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for table column survey question
#' @description Creates a plot for table column survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_table_oszlop <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for discrete distribution survey question
#' @description Creates a plot for discrete distribution survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_diszkret_eloszlas <- function(question) {
  # TODO: fill in ECharts code
}
#' @title ECharts template for other table survey question
#' @description Creates a plot for other table survey questions using echarts4r.
#'
#' @param question A list containing wrangled data and plot parameters
#' @return An echarts4r object
#' @importFrom echarts4r e_charts

survey_echarts_table_egyeb <- function(question) {
  # TODO: fill in ECharts code
}
