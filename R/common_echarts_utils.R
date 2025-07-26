#' Common ECharts utility function
#'
#' @description Applies common styling and features to echarts4r objects including
#' grid layout, loading animation, and toolbox features.
#'
#' @param echarts An echarts4r object
#' @param top Top margin for grid (default: 50)
#' @param bottom Bottom margin for grid (default: 60)  
#' @param right Right margin for grid (default: 20)
#' @param left Left margin for grid (default: 10)
#' @param contain_label Whether grid should contain axis labels (default: TRUE)
#' @param loading_text Loading text (default: "")
#' @param loading_color Loading spinner color (default: "#8D807788")
#' @param toolbox_features Vector of toolbox features to include (default: "saveAsImage")
#' @return An echarts4r object with applied common utilities
#' @importFrom echarts4r e_grid e_show_loading e_toolbox_feature
#' @export
#' @examples
#' \dontrun{
#' library(echarts4r)
#' 
#' # Basic usage
#' mtcars |>
#'   e_charts(mpg) |>
#'   e_scatter(hp) |>
#'   common_echarts_utils()
#'   
#' # Custom margins
#' mtcars |>
#'   e_charts(mpg) |>
#'   e_scatter(hp) |>
#'   common_echarts_utils(top = 80, bottom = 100)
#' }
common_echarts_utils <- function(echarts, 
                                top = 50, 
                                bottom = 60, 
                                right = 20, 
                                left = 10,
                                contain_label = TRUE,
                                loading_text = "",
                                loading_color = "#8D807788",
                                toolbox_features = "saveAsImage") {
  
  # Input validation
  if (!inherits(echarts, "echarts4r")) {
    stop("Input must be an echarts4r object")
  }
  
  if (!is.numeric(c(top, bottom, right, left))) {
    stop("Margin parameters must be numeric")
  }
  
  if (!is.logical(contain_label)) {
    stop("contain_label must be logical (TRUE/FALSE)")
  }
  
  if (!is.character(loading_text)) {
    stop("loading_text must be character")
  }
  
  if (!is.character(loading_color)) {
    stop("loading_color must be character")
  }
  
  # Apply common utilities
  result <- echarts |>
        echarts4r::e_y_axis(axisLabel = list(
            hideOverlap = FALSE, 
            interval = 0, 
            width = 100,
            #overflow = 'break', 
            margin = 15
        )) |>
        echarts4r::e_x_axis(axisLabel = list(
            hideOverlap = FALSE, 
            interval = 0, 
            width = 100,
            #overflow = 'break', 
            margin = 15
        )) |>
    echarts4r::e_grid(
      top = top,
      bottom = bottom,
      right = right,
      left = left,
      containLabel = contain_label
    ) |>
    echarts4r::e_show_loading(
      text = loading_text,
      color = loading_color
    ) |> 
    echarts4r::e_toolbox_feature(feature = toolbox_features)
  
  return(result)
}
