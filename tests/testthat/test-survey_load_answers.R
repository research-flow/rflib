library(testthat)

test_that("survey_load_answers reads Excel and pivots data correctly", {
    df_long <- survey_load_answers("extdata/mock_raw.xlsx")
    expect_true("respondent_id" %in% names(df_long))
    expect_true("question" %in% names(df_long))
    expect_true("answer" %in% names(df_long))
})
