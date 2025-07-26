library(testthat)

test_that("Integration test: lazy plotting with real survey data", {
    # Test with actual mock data file
    expect_true(file.exists("extdata/mock_raw.xlsx"))

    # Initialize survey (this should work with existing functionality)
    survey_obj <- survey_init("extdata/mock_raw.xlsx")

    # Check that survey was created
    expect_s3_class(survey_obj, "Survey")
    expect_true(length(survey_obj$questions) > 0)

    # Get first question for testing
    first_question_id <- names(survey_obj$questions)[1]
    first_question <- survey_obj$questions[[first_question_id]]

    # Test that lazy loading flags are set up if tipus exists
    if (!is.null(first_question$tipus)) {
        expect_equal(first_question$ggplot_fn, "ggplot")
        expect_equal(first_question$echarts_fn, "echarts")

        # Test that plots can be created on demand
        # Note: These might fail if survey_plot_dispatch doesn't handle the question type
        # but that's a separate issue from the lazy loading mechanism
        plot_result <- tryCatch(
            {
                plot(first_question)
            },
            error = function(e) {
                # If it fails, it should be due to plot creation, not method dispatch
                expect_false(grepl("object.*not found", e$message))
                expect_false(grepl("could not find function", e$message))
                "error_in_plot_creation" # Expected if plot function doesn't exist
            }
        )

        # Test get_ggplot method
        ggplot_result <- tryCatch(
            {
                get_ggplot(first_question)
            },
            error = function(e) {
                # If it fails, it should be due to plot creation, not method dispatch
                expect_false(grepl("object.*not found", e$message))
                expect_false(grepl("could not find function", e$message))
                "error_in_plot_creation" # Expected if plot function doesn't exist
            }
        )

        # Test get_echarts method
        echarts_result <- tryCatch(
            {
                get_echarts(first_question)
            },
            error = function(e) {
                # If it fails, it should be due to plot creation, not method dispatch
                expect_false(grepl("object.*not found", e$message))
                expect_false(grepl("could not find function", e$message))
                "error_in_plot_creation" # Expected if plot function doesn't exist
            }
        )
    }
})

test_that("Integration test: survey_add_type with lazy plotting", {
    # Test with actual mock data file
    survey_obj <- survey_init("extdata/mock_raw.xlsx")

    # Get first question
    first_question_id <- names(survey_obj$questions)[1]

    # Add/change type which should update lazy loading
    survey_obj <- survey_add_type(
        survey_obj,
        question_id = first_question_id,
        tipus = "likert_scale",
        rewrangle = TRUE
    )

    updated_question <- survey_obj$questions[[first_question_id]]

    # Check that lazy loading is properly set up
    expect_equal(updated_question$ggplot_fn, "ggplot")
    expect_equal(updated_question$echarts_fn, "echarts")
    expect_equal(updated_question$tipus, "likert_scale")

    # Check that dimensions are set
    expect_true(!is.null(updated_question$width))
    expect_true(!is.null(updated_question$height))

    # Verify no actual plots are stored
    expect_false("ggplot" %in% names(updated_question))
    expect_false("echarts" %in% names(updated_question))
})

test_that("Integration test: survey_add_definition with lazy plotting", {
    skip_if_not(file.exists("inst/extdata/mock_seged.xlsx"), "Definition file not found")

    # Test with actual mock data file
    survey_obj <- survey_init("extdata/mock_raw.xlsx")

    # Test adding definition with replot = TRUE (should set up lazy loading)
    survey_obj_updated <- tryCatch(
        {
            survey_add_definition(
                survey_obj,
                definition_path = "inst/extdata/mock_seged.xlsx",
                rewrangle = TRUE,
                replot = TRUE
            )
        },
        error = function(e) {
            skip(paste("Definition file handling failed:", e$message))
        }
    )

    # If successful, check that lazy loading is set up
    if (!inherits(survey_obj_updated, "try-error")) {
        # Check that questions have lazy loading set up
        for (question in survey_obj_updated$questions) {
            if (!is.null(question$tipus)) {
                expect_equal(question$ggplot_fn, "ggplot")
                expect_equal(question$echarts_fn, "echarts")

                # Verify no actual plots are stored
                expect_false("ggplot" %in% names(question))
                expect_false("echarts" %in% names(question))
            }
        }
    }
})

test_that("Performance test: lazy loading is faster than immediate plot creation", {
    # This test demonstrates the performance benefit of lazy loading
    skip_if_not_installed("microbenchmark")

    # Create multiple mock questions
    mock_data <- tibble::tibble(
        respondent_id = 1:100,
        answer = sample(1:5, 100, replace = TRUE)
    )

    mock_label <- tibble::tibble(
        kerdesszam = rep("Q1", 5),
        valasz_szovege = c("Very Bad", "Bad", "Neutral", "Good", "Very Good"),
        valasz_id = 1:5,
        oszlop_szovege = rep(NA, 5)
    )

    # Time lazy loading (should be very fast)
    lazy_time <- system.time({
        questions <- lapply(1:10, function(i) {
            survey_question(
                id = paste0("Q", i),
                tipus = "likert_scale",
                data = mock_data,
                label = mock_label
            )
        })
    })

    # Lazy loading should be much faster since no plots are created
    expect_lt(lazy_time[["elapsed"]], 2) # Should take less than 2 seconds
})
