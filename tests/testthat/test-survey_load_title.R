library(testthat)

test_that("survey_load_title extracts title from Információ sheet A2", {
    title <- survey_load_title("extdata/mock_raw.xlsx")
    expect_type(title, "character")
    expect_true(nchar(title) > 0)
})
