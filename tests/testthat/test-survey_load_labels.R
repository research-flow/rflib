library(testthat)

test_that("survey_load_labels returns correct columns", {
    df_labels <- survey_load_labels("extdata/mock_raw.xlsx")
    expect_true(all(c("kerdesszam", "kerdes_szoveg", "valasz_szamjele") %in% names(df_labels)))
})
