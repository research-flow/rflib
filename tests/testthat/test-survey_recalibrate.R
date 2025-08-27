library(testthat)
test_that("survey_recalibrate filters respondents correctly", {
  # Create test data
  test_data1 <- data.frame(
    respondent_id = c(1, 1, 2, 2, 3, 3, 4, 4),
    answer = c("A", "B", "A", "C", "B", "A", "C", "A"),
    stringsAsFactors = FALSE
  )
  
  test_data2 <- data.frame(
    respondent_id = c(1, 2, 3, 4, 5),
    answer = c(5, 4, 3, 2, 1),
    stringsAsFactors = FALSE
  )
  
  # Create test labels
  test_labels <- data.frame(
    valasz_szovege = c("A", "B", "C"),
    oszlop_szovege = c("Option A", "Option B", "Option C"),
    stringsAsFactors = FALSE
  )
  
  # Create survey questions
  q1 <- survey_question("Q1", "col_eloszlas_total", test_data1, test_labels)
  q2 <- survey_question("Q2", "likert_scale", test_data2, test_labels)
  
  # Create survey
  survey_obj <- survey("Test Survey", test_labels, n_respondent = 5)
  survey_obj <- survey_add_question(survey_obj, q1)
  survey_obj <- survey_add_question(survey_obj, q2)
  
  # Test filtering to respondents 1, 2, 3
  filtered_survey <- survey_recalibrate(survey_obj, c(1, 2, 3), "Filtered Group")
  
  # Check that data is filtered correctly
  expect_equal(nrow(filtered_survey$questions$Q1$data), 6) # 3 respondents * 2 rows each
  expect_equal(nrow(filtered_survey$questions$Q2$data), 3) # 3 respondents * 1 row each
  
  # Check respondent counts
  expect_equal(filtered_survey$questions$Q1$n_respondent, 3)
  expect_equal(filtered_survey$questions$Q2$n_respondent, 3)
  expect_equal(filtered_survey$n_respondent, 3)
  
  # Check that labels are preserved
  expect_equal(filtered_survey$questions$Q1$label, test_labels)
  expect_equal(filtered_survey$questions$Q2$label, test_labels)
  
  # Check that other attributes are preserved and group is updated
  expect_equal(filtered_survey$questions$Q1$tipus, "col_eloszlas_total")
  expect_equal(filtered_survey$questions$Q2$tipus, "likert_scale")
  expect_equal(filtered_survey$questions$Q1$group, "Filtered Group")
  expect_equal(filtered_survey$questions$Q2$group, "Filtered Group")
})

test_that("survey_recalibrate handles edge cases", {
  # Create test data
  test_data <- data.frame(
    respondent_id = c(1, 2, 3),
    answer = c("A", "B", "C"),
    stringsAsFactors = FALSE
  )
  
  test_labels <- data.frame(
    valasz_szovege = c("A", "B", "C"),
    oszlop_szovege = c("Option A", "Option B", "Option C"),
    stringsAsFactors = FALSE
  )
  
  # Create survey
  q1 <- survey_question("Q1", "col_eloszlas", test_data, test_labels)
  survey_obj <- survey("Test Survey", test_labels)
  survey_obj <- survey_add_question(survey_obj, q1)
  
  # Test with empty respondent_ids
  expect_error(survey_recalibrate(survey_obj, c(), "Empty Group"), "respondent_ids cannot be empty")
  
  # Test with missing group_name
  expect_error(survey_recalibrate(survey_obj, c(1, 2)), "group_name must be provided")
  
  # Test with empty group_name
  expect_error(survey_recalibrate(survey_obj, c(1, 2), ""), "group_name must be provided")
  
  # Test with non-Survey object
  expect_error(survey_recalibrate("not a survey", c(1, 2), "Test Group"), "survey_obj must be of class Survey")
  
  # Test filtering to non-existent respondents
  expect_warning(
    filtered_survey <- survey_recalibrate(survey_obj, c(99, 100), "Non-existent Group"),
    "has no data after filtering"
  )
  expect_equal(nrow(filtered_survey$questions$Q1$data), 0)
  expect_equal(filtered_survey$questions$Q1$n_respondent, 0)
})

test_that("survey_recalibrate preserves color scales and special attributes", {
  # Create test data
  test_data <- data.frame(
    respondent_id = c(1, 2, 3, 4),
    answer = c("A", "B", "A", "C"),
    stringsAsFactors = FALSE
  )
  
  test_labels <- data.frame(
    valasz_szovege = c("A", "B", "C"),
    oszlop_szovege = c("Option A", "Option B", "Option C"),
    stringsAsFactors = FALSE
  )
  
  # Create survey question with color scale and likert labeller
  q1 <- survey_question("Q1", "likert_scale", test_data, test_labels)
  q1$color_scale <- c("A" = "#FF0000", "B" = "#00FF00", "C" = "#0000FF")
  q1$likert_labeller <- function(x) paste("Label", x)
  
  survey_obj <- survey("Test Survey", test_labels)
  survey_obj <- survey_add_question(survey_obj, q1)
  
  # Filter to subset of respondents
  filtered_survey <- survey_recalibrate(survey_obj, c(1, 3), "Subset Group")
  
  # Check that special attributes are preserved and group is updated
  expect_equal(filtered_survey$questions$Q1$color_scale, q1$color_scale)
  expect_equal(filtered_survey$questions$Q1$likert_labeller, q1$likert_labeller)
  expect_equal(filtered_survey$questions$Q1$ggplot_fn, q1$ggplot_fn)
  expect_equal(filtered_survey$questions$Q1$echarts_fn, q1$echarts_fn)
  expect_equal(filtered_survey$questions$Q1$group, "Subset Group")
  
  # Check that data is correctly filtered
  expect_equal(nrow(filtered_survey$questions$Q1$data), 2)
  expect_true(all(filtered_survey$questions$Q1$data$respondent_id %in% c(1, 3)))
})

test_that("survey_recalibrate handles questions without respondent_id", {
  # Create test data without respondent_id
  test_data_no_id <- data.frame(
    answer = c("A", "B", "C"),
    stringsAsFactors = FALSE
  )
  
  test_labels <- data.frame(
    valasz_szovege = c("A", "B", "C"),
    oszlop_szovege = c("Option A", "Option B", "Option C"),
    stringsAsFactors = FALSE
  )
  
  # Create survey question without respondent_id
  q1 <- survey_question("Q1", "col_eloszlas", test_data_no_id, test_labels)
  survey_obj <- survey("Test Survey", test_labels)
  survey_obj <- survey_add_question(survey_obj, q1)
  
  # Test that warning is issued and question is skipped
  expect_warning(
    filtered_survey <- survey_recalibrate(survey_obj, c(1, 2), "No ID Group"),
    "does not have respondent_id column"
  )
  
  # Original data should be unchanged
  expect_equal(filtered_survey$questions$Q1$data, test_data_no_id)
})
