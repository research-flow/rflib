# Demo: Survey Recalibration Example
# This script demonstrates how to use survey_recalibrate() to filter survey data
# while preserving all labels and metadata

library(rflib)
library(dplyr)

# Create sample survey data
set.seed(123)

# Sample data for a multi-choice question
choice_data <- data.frame(
  respondent_id = rep(1:100, each = 2),
  answer = sample(c("Option A", "Option B", "Option C", "Option D"), 200, replace = TRUE),
  stringsAsFactors = FALSE
)

# Sample data for a Likert scale question  
likert_data <- data.frame(
  respondent_id = 1:100,
  answer = sample(1:5, 100, replace = TRUE),
  stringsAsFactors = FALSE
)

# Sample data for a numeric question
numeric_data <- data.frame(
  respondent_id = 1:100,
  answer = rnorm(100, mean = 50, sd = 10),
  stringsAsFactors = FALSE
)

# Create labels
choice_labels <- data.frame(
  valasz_szovege = c("Option A", "Option B", "Option C", "Option D"),
  oszlop_szovege = c("Choice A", "Choice B", "Choice C", "Choice D"),
  stringsAsFactors = FALSE
)

likert_labels <- data.frame(
  valasz_szovege = as.character(1:5),
  oszlop_szovege = c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"),
  stringsAsFactors = FALSE
)

numeric_labels <- data.frame(
  valasz_szovege = c("Low", "Medium", "High"),
  oszlop_szovege = c("Low Score", "Medium Score", "High Score"),
  stringsAsFactors = FALSE
)

# Create survey questions
choice_question <- survey_question("Q1", "col_eloszlas_multiple", choice_data, choice_labels)
likert_question <- survey_question("Q2", "likert_scale", likert_data, likert_labels)
numeric_question <- survey_question("Q3", "col_eloszlas", numeric_data, numeric_labels)

# Add color scales
choice_question$color_scale <- c("Option A" = "#FF6B6B", "Option B" = "#4ECDC4", 
                                "Option C" = "#45B7D1", "Option D" = "#96CEB4")
likert_question$color_scale <- c("1" = "#FF4757", "2" = "#FF6348", "3" = "#FFA502", 
                                "4" = "#26DE81", "5" = "#2ED573")

# Add Likert labeller
likert_question$likert_labeller <- function(x) {
  labels <- c("1" = "Strongly Disagree", "2" = "Disagree", "3" = "Neutral", 
              "4" = "Agree", "5" = "Strongly Agree")
  return(labels[as.character(x)])
}

# Create survey
original_survey <- survey("Sample Survey", choice_labels, n_respondent = 100)
original_survey <- survey_add_question(original_survey, choice_question)
original_survey <- survey_add_question(original_survey, likert_question)
original_survey <- survey_add_question(original_survey, numeric_question)

cat("Original Survey Statistics:\n")
cat("Total respondents:", original_survey$n_respondent, "\n")
cat("Q1 respondents:", original_survey$questions$Q1$n_respondent, "\n")
cat("Q2 respondents:", original_survey$questions$Q2$n_respondent, "\n")
cat("Q3 respondents:", original_survey$questions$Q3$n_respondent, "\n")
cat("Q1 data rows:", nrow(original_survey$questions$Q1$data), "\n")
cat("Q2 data rows:", nrow(original_survey$questions$Q2$data), "\n")
cat("Q3 data rows:", nrow(original_survey$questions$Q3$data), "\n\n")

# Example 1: Filter to first 30 respondents
cat("=== Example 1: Filter to first 30 respondents ===\n")
filtered_survey_30 <- survey_recalibrate(original_survey, 1:30, "First 30 Respondents")

cat("\nFiltered Survey (30 respondents) Statistics:\n")
cat("Total respondents:", filtered_survey_30$n_respondent, "\n")
cat("Q1 respondents:", filtered_survey_30$questions$Q1$n_respondent, "\n")
cat("Q2 respondents:", filtered_survey_30$questions$Q2$n_respondent, "\n")
cat("Q3 respondents:", filtered_survey_30$questions$Q3$n_respondent, "\n")

# Verify that all labels and attributes are preserved
cat("\nVerifying preservation of attributes:\n")
cat("Q1 color scale preserved:", 
    identical(original_survey$questions$Q1$color_scale, filtered_survey_30$questions$Q1$color_scale), "\n")
cat("Q2 likert labeller preserved:", 
    identical(original_survey$questions$Q2$likert_labeller, filtered_survey_30$questions$Q2$likert_labeller), "\n")
cat("Q1 labels preserved:", 
    identical(original_survey$questions$Q1$label, filtered_survey_30$questions$Q1$label), "\n")
cat("Group updated correctly:", filtered_survey_30$questions$Q1$group, "\n")

# Example 2: Filter to a specific subset of respondents
cat("\n=== Example 2: Filter to specific respondents (10, 25, 50, 75, 90) ===\n")
specific_respondents <- c(10, 25, 50, 75, 90)
filtered_survey_specific <- survey_recalibrate(original_survey, specific_respondents, "Selected Respondents")

cat("\nFiltered Survey (specific 5 respondents) Statistics:\n")
cat("Total respondents:", filtered_survey_specific$n_respondent, "\n")
cat("Q1 data rows:", nrow(filtered_survey_specific$questions$Q1$data), "\n")
cat("Q2 data rows:", nrow(filtered_survey_specific$questions$Q2$data), "\n")

# Show that original survey is unchanged
cat("\n=== Verification: Original survey unchanged ===\n")
cat("Original survey still has", original_survey$n_respondent, "respondents\n")
cat("Original Q1 still has", nrow(original_survey$questions$Q1$data), "data rows\n")

# Example 3: Demonstrate edge case - filtering to non-existent respondents
cat("\n=== Example 3: Edge case - non-existent respondents ===\n")
tryCatch({
  filtered_survey_empty <- survey_recalibrate(original_survey, c(999, 1000), "Non-existent Group")
  cat("Successfully created survey with", filtered_survey_empty$n_respondent, "respondents\n")
  cat("Q1 has", nrow(filtered_survey_empty$questions$Q1$data), "data rows after filtering\n")
}, warning = function(w) {
  cat("Warning caught:", w$message, "\n")
})

cat("\n=== Demo Complete ===\n")
cat("The survey_recalibrate() function successfully:\n")
cat("1. Filters all question data to specified respondents\n")
cat("2. Recalculates respondent counts\n")
cat("3. Re-wrangles data automatically\n")
cat("4. Preserves all labels, color scales, and metadata\n")
cat("5. Updates group names to the specified group_name\n")
cat("6. Handles edge cases gracefully\n")
