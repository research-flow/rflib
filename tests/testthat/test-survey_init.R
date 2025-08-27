library(testthat)

test_that("survey_init returns all expected elements and correct types", {
    result <- survey_init("extdata/mock_raw.xlsx")
    expect_true(is.list(result))
    expect_true(all(c(
        "title",
        "data",
        "classified",
        "wrangled",
        "plots"
    ) %in% names(result)))
    expect_true(is.data.frame(result$data))
    expect_true(is.character(result$title) || is.null(result$title))
    # expect_true(is.data.frame(result$classified))
    # expect_true(is.data.frame(result$wrangled))
    # expect_true(is.data.frame(result$plots))
})
