# Demo script for common_echarts_utils function
# Run this after loading the rflib package

library(rflib)
library(echarts4r)

# Example 1: Basic scatter plot with common utilities
demo_scatter <- function() {
  mtcars |>
    e_charts(mpg) |>
    e_scatter(hp, size = disp) |>
    e_title("Car Performance") |>
    common_echarts_utils()
}

# Example 2: Bar chart with custom margins
demo_bar <- function() {
  mtcars |>
    dplyr::slice_head(n = 10) |>
    e_charts(rownames) |>
    e_bar(mpg) |>
    e_title("Top 10 Cars by MPG") |>
    common_echarts_utils(
      top = 80,
      bottom = 100,
      loading_text = "Loading chart...",
      loading_color = "#FF6B6B"
    )
}

# Example 3: Line chart with multiple toolbox features
demo_line <- function() {
  mtcars |>
    dplyr::arrange(mpg) |>
    dplyr::mutate(car_index = seq_len(nrow(.))) |>
    e_charts(car_index) |>
    e_line(mpg, name = "MPG") |>
    e_line(hp, name = "Horsepower") |>
    e_title("Car Metrics Trend") |>
    common_echarts_utils(
      toolbox_features = c("saveAsImage", "restore", "dataView")
    )
}

# Run examples
cat("Running common_echarts_utils demos...\n")

# Uncomment to run:
# demo_scatter()
# demo_bar() 
# demo_line()

cat("Demo functions created. Call demo_scatter(), demo_bar(), or demo_line() to see examples.\n")
