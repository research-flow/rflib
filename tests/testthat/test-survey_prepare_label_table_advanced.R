library(testthat)

test_that("survey_prepare_label cleans and extracts label info", {
    df_labels <- survey_load_labels("extdata/mock_raw.xlsx")
    label_table <- survey_prepare_label(df_labels)
    expect_true(all(c("kerdes", "kerdes_szoveg", "valasz_szovege") %in% names(label_table)))
    expect_true(nrow(label_table) > 0)
})
