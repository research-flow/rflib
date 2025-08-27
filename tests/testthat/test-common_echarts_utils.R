qtest_that("common_echarts_utils works with valid echarts4r object", {
  skip_if_not_installed("echarts4r")
  
  # Create a basic echarts object
  chart <- mtcars %>%
    echarts4r::e_charts(mpg) %>%
    echarts4r::e_scatter(hp)
  
  # Test basic functionality
  result <- common_echarts_utils(chart)
  
  # Should return an echarts4r object
  expect_s3_class(result, "echarts4r")
  expect_s3_class(result, "htmlwidget")
})

test_that("common_echarts_utils validates input types", {
  # Test with non-echarts4r object
  expect_error(
    common_echarts_utils("not_a_chart"),
    "Input must be an echarts4r object"
  )
  
  # Test with invalid margin parameters
  skip_if_not_installed("echarts4r")
  chart <- mtcars %>%
    echarts4r::e_charts(mpg) %>%
    echarts4r::e_scatter(hp)
    
  expect_error(
    common_echarts_utils(chart, top = "invalid"),
    "Margin parameters must be numeric"
  )
  
  expect_error(
    common_echarts_utils(chart, contain_label = "yes"),
    "contain_label must be logical"
  )
  
  expect_error(
    common_echarts_utils(chart, loading_text = 123),
    "loading_text must be character"
  )
  
  expect_error(
    common_echarts_utils(chart, loading_color = 123),
    "loading_color must be character"
  )
})

test_that("common_echarts_utils accepts custom parameters", {
  skip_if_not_installed("echarts4r")
  
  chart <- mtcars %>%
    echarts4r::e_charts(mpg) %>%
    echarts4r::e_scatter(hp)
  
  # Test with custom parameters
  result <- common_echarts_utils(
    chart, 
    top = 100, 
    bottom = 80, 
    right = 30, 
    left = 20,
    contain_label = FALSE,
    loading_text = "Loading...",
    loading_color = "#FF0000",
    toolbox_features = c("saveAsImage", "restore")
  )
  
  expect_s3_class(result, "echarts4r")
})

test_that("common_echarts_utils works with different chart types", {
  skip_if_not_installed("echarts4r")
  
  # Test with bar chart
  bar_chart <- mtcars %>%
    echarts4r::e_charts(rownames) %>%
    echarts4r::e_bar(mpg)
  
  result1 <- common_echarts_utils(bar_chart)
  expect_s3_class(result1, "echarts4r")
  
  # Test with line chart
  line_chart <- mtcars %>%
    echarts4r::e_charts(mpg) %>%
    echarts4r::e_line(hp)
  
  result2 <- common_echarts_utils(line_chart)
  expect_s3_class(result2, "echarts4r")
})

test_that("common_echarts_utils preserves existing chart configuration", {
  skip_if_not_installed("echarts4r")
  
  # Create chart with some existing configuration
  chart <- mtcars %>%
    echarts4r::e_charts(mpg) %>%
    echarts4r::e_scatter(hp) %>%
    echarts4r::e_title("Test Chart") %>%
    echarts4r::e_legend(show = FALSE)
  
  result <- common_echarts_utils(chart)
  
  # Should still be a valid echarts4r object
  expect_s3_class(result, "echarts4r")
  
  # The x attribute should contain the chart configuration
  expect_true("opts" %in% names(result$x))
})
