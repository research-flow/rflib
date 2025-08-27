library(testthat)

test_that("survey_make_clean_names creates clean names correctly", {
    df_long <- survey_load_answers("extdata/mock_raw.xlsx")
    cleaned <- survey_make_clean_names(df_long)
    expect_true("name_clean" %in% names(cleaned))
    expect_true(all(grepl("x[0-9]+_[a-z]+_|x[0-9]+_[0-9]+_[0-9]+|x[0-9]+_.$", cleaned$name_clean)))
})
