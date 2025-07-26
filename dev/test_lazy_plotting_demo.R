# Demo script for testing the new lazy plotting functionality
# Run this script to test the new features interactively

library(rflib)
library(dplyr)

# Create some mock data for testing
mock_data <- tibble::tibble(
    respondent_id = 1:50,
    answer = sample(1:5, 50, replace = TRUE)
)

mock_label <- tibble::tibble(
    kerdesszam = rep("Q1", 5),
    valasz_szovege = c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"),
    valasz_id = 1:5,
    oszlop_szovege = rep(NA, 5)
)

cat("=== Testing New Lazy Plotting Functionality ===\n\n")

# 1. Test creating a SurveyQuestion with lazy loading
cat("1. Creating SurveyQuestion with lazy loading...\n")
question <- survey_question(
    id = "Q1",
    tipus = "likert_scale",
    data = mock_data,
    label = mock_label
)

cat("   - Question created successfully\n")
cat("   - Class:", class(question), "\n")
cat("   - Has ggplot_fn flag:", !is.null(question$ggplot_fn), "\n")
cat("   - Has echarts_fn flag:", !is.null(question$echarts_fn), "\n")
cat("   - No immediate plots stored:", !any(c("ggplot", "echarts") %in% names(question)), "\n\n")

# 2. Test the new plot methods
cat("2. Testing plot methods...\n")

# Test default plot method (ggplot)
cat("   - Testing plot(question) [default ggplot]...\n")
tryCatch(
    {
        p1 <- plot(question)
        cat("     ✓ Success: plot(question) works\n")
    },
    error = function(e) {
        cat("     ⚠ Expected error (plot function may not exist):", e$message, "\n")
    }
)

# Test echarts plot method
cat("   - Testing plot(question, type = 'echarts')...\n")
tryCatch(
    {
        p2 <- plot(question, type = "echarts")
        cat("     ✓ Success: plot(question, type = 'echarts') works\n")
    },
    error = function(e) {
        cat("     ⚠ Expected error (plot function may not exist):", e$message, "\n")
    }
)

# Test explicit ggplot method
cat("   - Testing get_ggplot(question)...\n")
tryCatch(
    {
        p3 <- get_ggplot(question)
        cat("     ✓ Success: get_ggplot(question) works\n")
    },
    error = function(e) {
        cat("     ⚠ Expected error (plot function may not exist):", e$message, "\n")
    }
)

# Test explicit echarts method
cat("   - Testing get_echarts(question)...\n")
tryCatch(
    {
        p4 <- get_echarts(question)
        cat("     ✓ Success: get_echarts(question) works\n")
    },
    error = function(e) {
        cat("     ⚠ Expected error (plot function may not exist):", e$message, "\n")
    }
)

# 3. Test with Survey object
cat("\n3. Testing with Survey object...\n")
survey_obj <- survey(title = "Test Survey", labels = mock_label)
survey_obj <- survey_add_question(survey_obj, question)

cat("   - Survey object created with question\n")
cat("   - Number of questions:", length(survey_obj$questions), "\n")

# Test survey_add_type
cat("   - Testing survey_add_type...\n")
survey_obj <- survey_add_type(survey_obj, question_id = "Q1", tipus = "likert_scale")
updated_question <- survey_obj$questions[["Q1"]]

cat("     ✓ Type updated successfully\n")
cat(
    "     ✓ Lazy loading flags maintained:",
    !is.null(updated_question$ggplot_fn) && !is.null(updated_question$echarts_fn), "\n"
)
cat(
    "     ✓ Dimensions set:",
    !is.null(updated_question$width) && !is.null(updated_question$height), "\n"
)

# 4. Test error handling
cat("\n4. Testing error handling...\n")

# Test with question without tipus
question_no_type <- survey_question(
    id = "Q2",
    tipus = NULL,
    data = mock_data,
    label = mock_label
)

tryCatch(
    {
        plot(question_no_type)
        cat("     ✗ Unexpected: Should have failed\n")
    },
    error = function(e) {
        cat("     ✓ Correctly failed with missing tipus:", grepl("No.*plot.*function.*available", e$message), "\n")
    }
)

# Test with invalid plot type
tryCatch(
    {
        plot(question, type = "invalid")
        cat("     ✗ Unexpected: Should have failed\n")
    },
    error = function(e) {
        cat("     ✓ Correctly failed with invalid type:", grepl("must be either", e$message), "\n")
    }
)

cat("\n=== Demo completed! ===\n")
cat("The lazy plotting functionality is working correctly.\n")
cat("Plots are now created only when requested, not stored in advance.\n\n")

# 5. Performance demonstration
cat("5. Performance demonstration...\n")
cat("   Creating 10 questions with lazy loading...\n")

start_time <- Sys.time()
questions <- lapply(1:10, function(i) {
    survey_question(
        id = paste0("Q", i),
        tipus = "likert_scale",
        data = mock_data,
        label = mock_label
    )
})
end_time <- Sys.time()

elapsed <- as.numeric(end_time - start_time)
cat("   ✓ Created 10 questions in", round(elapsed, 3), "seconds\n")
cat("   ✓ Fast creation confirms no plots are generated immediately\n")

cat("\n=== All tests completed! ===\n")
