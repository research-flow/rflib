# TODO
# 1. ChatGPT cleaans textual answers
# 2. ChatGPT analyses the question outputs in Hungarian
# 3. Grouping the RFAZONs and reiterating the plots


# # Load all R files from ../R (for environments without devtools)
# files <- list.files(path = "R", full.names = TRUE, pattern = "survey_.*\\.[Rr]$|integer_.*\\.[Rr]$")
# for (f in files) source(f)

# library(testthat)
# library(readxl)
# library(tibble)
# library(tidyr)
# library(dplyr)
# library(ggplot2)
# library(forcats)
# library(stringr)

# test_that("survey_wrangle_resz_egesz_total works and errors on bad input", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("1", "2", "3"))
#     labels <- tibble(kerdes = "A", kerdesszam = 1, kerdesbetu = "a", valasz_szovege = "Test")
#     expect_silent(survey_wrangle_resz_egesz_total(df, labels))
#     df_bad <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("1", "foo", "3"))
#     expect_error(survey_wrangle_resz_egesz_total(df_bad, labels))
# })

# test_that("survey_wrangle_resz_egesz_multiple works and errors on bad input", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("1", "2", "3"))
#     labels <- tibble(kerdes = "A", kerdesszam = 1, kerdesbetu = "a", valasz_szovege = "Test")
#     expect_silent(survey_wrangle_resz_egesz_multiple(df, labels))
#     df_bad <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("1", "foo", "3"))
#     expect_error(survey_wrangle_resz_egesz_multiple(df_bad, labels))
# })

# test_that("survey_wrangle_likert_scale works and errors on bad input", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("1", "2", "3"))
#     labels <- tibble(kerdes = "A", kerdesszam = 1, kerdesbetu = "a", tol = 1, ig = 3, valasz_szovege = "Test")
#     expect_silent(survey_wrangle_likert_scale(df, labels))
#     df_bad <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("1", "foo", "3"))
#     expect_error(survey_wrangle_likert_scale(df_bad, labels))
# })

# test_that("survey_wrangle_col_eloszlas_total works and errors on bad input", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("on", "on", "off"))
#     labels <- tibble(kerdes = "A", valasz_szovege = "Test")
#     expect_silent(survey_wrangle_col_eloszlas_total(df, labels))
#     df_bad <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c(1, 2, 3))
#     expect_error(survey_wrangle_col_eloszlas_total(df_bad, labels))
# })

# test_that("survey_wrangle_col_eloszlas_multiple works and errors on bad input", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("on", "on", "off"))
#     labels <- tibble(kerdes = "A", valasz_szovege = "Test")
#     expect_silent(survey_wrangle_col_eloszlas_multiple(df, labels))
#     df_bad <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c(1, 2, 3))
#     expect_error(survey_wrangle_col_eloszlas_multiple(df_bad, labels))
# })

# test_that("survey_wrangle_year_eloszlas_unscale works and errors on bad input", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("2020", "2021", "2022"))
#     labels <- tibble(kerdes = "A", kerdesszam = 1, kerdesbetu = "a")
#     expect_silent(survey_wrangle_year_eloszlas_unscale(df, labels))
#     df_bad <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("2020", "foo", "2022"))
#     expect_error(survey_wrangle_year_eloszlas_unscale(df_bad, labels))
# })

# test_that("survey_wrangle_year_eloszlas works and errors on bad input", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("2020", "2021", "2022"))
#     labels <- tibble(kerdes = "A", kerdesszam = 1, kerdesbetu = "a")
#     expect_silent(survey_wrangle_year_eloszlas(df, labels))
#     df_bad <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("2020", "foo", "2022"))
#     expect_error(survey_wrangle_year_eloszlas(df_bad, labels))
# })

# test_that("survey_wrangle_table works on synthetic data", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("1", "2", "3"))
#     labels <- tibble(kerdes = "A", kerdesszam = 1, kerdesbetu = "a", oszlop_szovege = "Col", valasz_szovege = "Test")
#     result <- survey_wrangle_table(df, labels)
#     expect_true("perc" %in% names(result))
# })

# test_that("survey_wrangle_szoveg_buborek_multiple works on synthetic data", {
#     df <- tibble(respondent_id = 1:3, kerdes = c("A", "A", "A"), answer = c("foo;bar", "baz", "qux"))
#     labels <- tibble(kerdes = "A", oszlop_szovege = "Col", valasz_szovege = "Valasz")
#     result <- survey_wrangle_szoveg_buborek_multiple(df, labels)
#     expect_true("total_szoveg" %in% names(result))
# })
# # Test survey_load_answers with Excel file
# test_that("survey_load_answers reads Excel and pivots data correctly", {
#     df_long <- survey_load_answers("inst/extdata/mock_raw.xlsx")
#     expect_true("respondent_id" %in% names(df_long))
#     expect_true("question" %in% names(df_long))
#     expect_true("answer" %in% names(df_long))
# })

# # Test survey_load_labels (simulate reading from Excel)
# test_that("survey_load_labels returns correct columns", {
#     df_labels <- survey_load_labels("inst/extdata/mock_raw.xlsx")
#     expect_true(all(c("kerdesszam", "kerdes_szoveg", "valasz_szamjele") %in% names(df_labels)))
# })

# # Test survey_load_title with Excel file
# test_that("survey_load_title extracts title from Információ sheet A2", {
#     # Use a mock Excel file with a Információ sheet and a value in A2
#     # You must have inst/extdata/mock_title.xlsx with a Információ sheet and a value in A2 for this test to pass
#     title <- survey_load_title("inst/extdata/mock_raw.xlsx")
#     expect_type(title, "character")
#     expect_true(nchar(title) > 0)
# })






survey_obj <- survey_init("inst/extdata/mock_raw.xlsx")

survey_obj <- survey_add_definition(survey_obj,
    definition_path = "inst/extdata/mock_seged.xlsx",
    rewrangle = TRUE, replot = TRUE
)

survey_obj <- survey_add_type(survey_obj, question_id = 1, tipus = "year_eloszlas", rewrangle = TRUE)
survey_plot_dispatch("ggplot", survey_obj$questions[[1]])
survey_obj$questions[[8]]$color_scale
question <- survey_obj$questions[[8]]
