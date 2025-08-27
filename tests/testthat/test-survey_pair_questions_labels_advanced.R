library(testthat)

test_that("survey_pair_questions_labels joins cleaned names and labels correctly", {
    df_answers <- survey_load_answers("extdata/mock_raw.xlsx")
    df_labels <- survey_load_labels("extdata/mock_raw.xlsx")
    joined <- survey_pair_questions_labels(df_answers, df_labels)
    expect_true(all(c("question", "answer", "kerdes", "kerdes_szam") %in% names(joined)))
    expect_true(nrow(joined) > 0)
})
