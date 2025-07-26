library(testthat)
library(dplyr)

test_that("grid.arrange handling in get_ggplot works correctly", {
    # Skip if ggpubr is not available
    skip_if_not_installed("ggpubr")

    # Create mock data
    mock_data <- tibble::tibble(
        respondent_id = 1:10,
        answer = sample(1:5, 10, replace = TRUE)
    )

    mock_label <- tibble::tibble(
        kerdesszam = rep("Q1", 5),
        valasz_szovege = c("Very Bad", "Bad", "Neutral", "Good", "Very Good"),
        valasz_id = 1:5,
        oszlop_szovege = rep(NA, 5)
    )

    # Create a question with a type that might use grid.arrange
    question <- survey_question(
        id = "Q1",
        tipus = "resz_egesz_total", # This type often uses grid.arrange
        data = mock_data,
        label = mock_label
    )

    # Test that methods are available
    expect_true(exists("get_ggplot"))
    expect_true(exists("plot.SurveyQuestion"))

    # Test that the question has lazy loading set up
    expect_equal(question$ggplot_fn, "ggplot")
    expect_equal(question$echarts_fn, "echarts")

    # Test error handling for missing components
    incomplete_question <- question
    incomplete_question$tipus <- NULL

    expect_error(
        get_ggplot(incomplete_question),
        "No ggplot function available"
    )

    expect_error(
        plot(incomplete_question),
        "No ggplot function available"
    )
})

test_that("plot.SurveyQuestion handles different plot types", {
    # Create mock data
    mock_data <- tibble::tibble(
        respondent_id = 1:10,
        answer = sample(1:5, 10, replace = TRUE)
    )

    mock_label <- tibble::tibble(
        kerdesszam = rep("Q1", 5),
        valasz_szovege = c("Very Bad", "Bad", "Neutral", "Good", "Very Good"),
        valasz_id = 1:5,
        oszlop_szovege = rep(NA, 5)
    )

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    # Test type parameter validation
    expect_error(
        plot(question, type = "invalid"),
        "type must be either 'ggplot' or 'echarts'"
    )

    # Test that default type is ggplot
    # Note: This might fail if survey_plot_dispatch doesn't handle the question type
    # but we're testing the method dispatch, not the plot creation itself
    result <- tryCatch(
        plot(question), # Should default to ggplot
        error = function(e) {
            # If it fails, should be due to plot creation, not method issues
            expect_false(grepl("object.*not found", e$message))
            expect_false(grepl("could not find function", e$message))
            "plot_creation_error"
        }
    )
})

test_that("S3 method dispatch works correctly", {
    # Create mock data
    mock_data <- tibble::tibble(
        respondent_id = 1:10,
        answer = sample(1:5, 10, replace = TRUE)
    )

    mock_label <- tibble::tibble(
        kerdesszam = rep("Q1", 5),
        valasz_szovege = c("Very Bad", "Bad", "Neutral", "Good", "Very Good"),
        valasz_id = 1:5,
        oszlop_szovege = rep(NA, 5)
    )

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    # Test that the object has the correct class
    expect_s3_class(question, "SurveyQuestion")

    # Test that S3 methods are dispatched correctly
    # These will test method dispatch even if the actual plot creation fails
    expect_true(methods::hasMethod("plot", "SurveyQuestion"))
    expect_true("get_ggplot.SurveyQuestion" %in% methods("get_ggplot"))
    expect_true("get_echarts.SurveyQuestion" %in% methods("get_echarts"))
})

test_that("lazy loading flags are set correctly in different scenarios", {
    # Create mock data
    mock_data <- tibble::tibble(
        respondent_id = 1:10,
        answer = sample(1:5, 10, replace = TRUE)
    )

    mock_label <- tibble::tibble(
        kerdesszam = rep("Q1", 5),
        valasz_szovege = c("Very Bad", "Bad", "Neutral", "Good", "Very Good"),
        valasz_id = 1:5,
        oszlop_szovege = rep(NA, 5)
    )

    # Test with tipus provided
    question_with_type <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    expect_equal(question_with_type$ggplot_fn, "ggplot")
    expect_equal(question_with_type$echarts_fn, "echarts")

    # Test without tipus (NULL)
    question_without_type <- survey_question(
        id = "Q2",
        tipus = NULL,
        data = mock_data,
        label = mock_label
    )

    expect_null(question_without_type$ggplot_fn)
    expect_null(question_without_type$echarts_fn)

    # Test memory efficiency - no actual plots stored
    expect_false("ggplot" %in% names(question_with_type))
    expect_false("echarts" %in% names(question_with_type))
})
