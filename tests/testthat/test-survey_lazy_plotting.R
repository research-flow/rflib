library(testthat)
library(dplyr)

# Create mock data for testing
create_mock_question_data <- function() {
    tibble::tibble(
        respondent_id = 1:10,
        answer = sample(1:5, 10, replace = TRUE)
    )
}

create_mock_label_data <- function() {
    tibble::tibble(
        kerdesszam = rep("Q1", 5),
        valasz_szovege = c("Very Bad", "Bad", "Neutral", "Good", "Very Good"),
        valasz_id = 1:5,
        oszlop_szovege = rep(NA, 5)
    )
}

test_that("survey_question creates lazy loading structure correctly", {
    # Test with tipus provided
    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    # Check that the object has the correct structure
    expect_s3_class(question, "SurveyQuestion")
    expect_equal(question$id, "Q1")
    expect_equal(question$tipus, "likert_scale")
    expect_true(is.data.frame(question$data))

    # Check that lazy loading flags are set
    expect_equal(question$ggplot_fn, "ggplot")
    expect_equal(question$echarts_fn, "echarts")

    # Check that no actual plots are stored
    expect_false("ggplot" %in% names(question))
    expect_false("echarts" %in% names(question))
})

test_that("survey_question without tipus doesn't set lazy loading flags", {
    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = NULL,
        data = mock_data,
        label = mock_label
    )

    # Check that lazy loading flags are not set
    expect_null(question$ggplot_fn)
    expect_null(question$echarts_fn)
})

test_that("survey_add_type sets up lazy loading correctly", {
    # Create a survey with a question
    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()
    mock_title <- "Test Survey"

    survey_obj <- survey(title = mock_title, labels = mock_label)
    question <- survey_question(
        id = "Q1",
        tipus = NULL,
        data = mock_data,
        label = mock_label
    )
    survey_obj <- survey_add_question(survey_obj, question)

    # Add type which should set up lazy loading
    survey_obj <- survey_add_type(survey_obj, question_id = "Q1", tipus = "likert_scale")

    updated_question <- survey_obj$questions[["Q1"]]

    # Check that lazy loading flags are set
    expect_equal(updated_question$ggplot_fn, "ggplot")
    expect_equal(updated_question$echarts_fn, "echarts")
    expect_equal(updated_question$tipus, "likert_scale")

    # Check dimensions are set
    expect_true(!is.null(updated_question$width))
    expect_true(!is.null(updated_question$height))
})

test_that("plot.SurveyQuestion works with default ggplot", {
    skip_if_not_installed("ggplot2")

    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    # This should work without error if survey_plot_dispatch exists
    # We'll just test that it doesn't throw an error about missing functions
    expect_error(
        plot(question),
        NA # NA means we expect no error, or if there is an error, it should be about plot creation, not method dispatch
    )
})

test_that("plot.SurveyQuestion works with echarts type", {
    skip_if_not_installed("echarts4r")

    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    # This should work without error if survey_plot_dispatch exists
    expect_error(
        plot(question, type = "echarts"),
        NA # NA means we expect no error, or if there is an error, it should be about plot creation, not method dispatch
    )
})

test_that("plot.SurveyQuestion fails with invalid type", {
    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    expect_error(
        plot(question, type = "invalid"),
        "type must be either 'ggplot' or 'echarts'"
    )
})

test_that("get_ggplot.SurveyQuestion works correctly", {
    skip_if_not_installed("ggplot2")

    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    # This should work without error if survey_plot_dispatch exists
    expect_error(
        get_ggplot(question),
        NA # NA means we expect no error, or if there is an error, it should be about plot creation, not method dispatch
    )
})

test_that("get_echarts.SurveyQuestion works correctly", {
    skip_if_not_installed("echarts4r")

    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    # This should work without error if survey_plot_dispatch exists
    expect_error(
        get_echarts(question),
        NA # NA means we expect no error, or if there is an error, it should be about plot creation, not method dispatch
    )
})

test_that("plot methods fail gracefully with missing tipus", {
    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    question <- survey_question(
        id = "Q1",
        tipus = NULL,
        data = mock_data,
        label = mock_label
    )

    expect_error(
        plot(question),
        "No ggplot function available for this question"
    )

    expect_error(
        get_ggplot(question),
        "No ggplot function available for this question"
    )

    expect_error(
        get_echarts(question),
        "No echarts function available for this question"
    )
})

test_that("lazy loading doesn't create plots immediately", {
    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()

    # Record the time before creating the question
    start_time <- Sys.time()

    question <- survey_question(
        id = "Q1",
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )

    end_time <- Sys.time()

    # Question creation should be very fast since no plots are generated
    expect_lt(as.numeric(end_time - start_time), 1) # Less than 1 second

    # Verify no plot objects exist in the question
    plot_related_names <- names(question)[grepl("plot", names(question), ignore.case = TRUE)]
    actual_plot_objects <- sapply(plot_related_names, function(name) {
        obj <- question[[name]]
        # Check if it's an actual plot object (not just a string flag)
        inherits(obj, c("ggplot", "echarts4r", "htmlwidget"))
    })

    expect_false(any(actual_plot_objects))
})

test_that("Memory efficiency - multiple questions don't store plots", {
    mock_data <- create_mock_question_data()
    mock_label <- create_mock_label_data()
    mock_title <- "Test Survey"

    survey_obj <- survey(title = mock_title, labels = mock_label)

    # Create multiple questions
    for (i in 1:10) {
        question <- survey_question(
            id = paste0("Q", i),
            tipus = "likert_scale",
            data = mock_data,
            label = mock_label
        )
        survey_obj <- survey_add_question(survey_obj, question)
    }

    # Check that no actual plot objects are stored
    all_questions <- survey_obj$questions

    for (q in all_questions) {
        # Check that only function flags are stored, not actual plots
        expect_equal(q$ggplot_fn, "ggplot")
        expect_equal(q$echarts_fn, "echarts")

        # Verify no actual plot objects
        expect_false("ggplot" %in% names(q))
        expect_false("echarts" %in% names(q))
    }
})
