# Test script for new lazy plot loading functionality
# This tests the new plot.SurveyQuestion, get_ggplot, and get_echarts methods

# Load the package
library(devtools)
load_all()
library(tidyverse)

# Test 1: Initialize survey and check structure
cat("Test 1: Survey initialization and structure\n")
survey_obj <- rflib::survey_init("inst/extdata/mock_raw.xlsx")

# Check that ggplot_fn and echarts_fn are NULL initially (no tipus set)
question_1 <- survey_obj$questions[[1]]
cat("Question 1 has ggplot_fn:", !is.null(question_1$ggplot_fn), "\n")
cat("Question 1 has echarts_fn:", !is.null(question_1$echarts_fn), "\n")

# Test 2: Add definition and check that function flags are set
cat("\nTest 2: Adding definition with types\n")
survey_obj <- rflib::survey_add_definition(survey_obj,
    definition_path = "inst/extdata/mock_seged.xlsx",
    rewrangle = TRUE, replot = TRUE
)

# Check that ggplot_fn and echarts_fn are now set
question_1_updated <- survey_obj$questions[[1]]
cat("After definition - Question 1 has ggplot_fn:", !is.null(question_1_updated$ggplot_fn), "\n")
cat("After definition - Question 1 has echarts_fn:", !is.null(question_1_updated$echarts_fn), "\n")
cat("Question 1 tipus:", question_1_updated$tipus, "\n")

# Test 3: Add specific type and test plot creation
cat("\nTest 3: Adding specific type and testing plot creation\n")
survey_obj <- survey_add_type(survey_obj, question_id = 1, tipus = "year_eloszlas", rewrangle = TRUE)
question_1_typed <- survey_obj$questions[[1]]
cat("Question 1 final tipus:", question_1_typed$tipus, "\n")

# Test 4: Test the new lazy plot methods
cat("\nTest 4: Testing new plot methods\n")

# Test plot() method (default ggplot)
cat("Testing plot() method...\n")
tryCatch(
    {
        p1 <- plot(question_1_typed)
        cat("✓ plot() method works - created:", class(p1)[1], "\n")
    },
    error = function(e) {
        cat("✗ plot() method failed:", e$message, "\n")
    }
)

# Test plot() method with echarts
cat("Testing plot(type='echarts') method...\n")
tryCatch(
    {
        p2 <- plot(question_1_typed, type = "echarts")
        cat("✓ plot(type='echarts') method works - created:", class(p2)[1], "\n")
    },
    error = function(e) {
        cat("✗ plot(type='echarts') method failed:", e$message, "\n")
    }
)

# Test get_ggplot() method
cat("Testing get_ggplot() method...\n")
tryCatch(
    {
        p3 <- get_ggplot(question_1_typed)
        cat("✓ get_ggplot() method works - created:", class(p3)[1], "\n")
    },
    error = function(e) {
        cat("✗ get_ggplot() method failed:", e$message, "\n")
    }
)

# Test get_echarts() method
cat("Testing get_echarts() method...\n")
tryCatch(
    {
        p4 <- get_echarts(question_1_typed)
        cat("✓ get_echarts() method works - created:", class(p4)[1], "\n")
    },
    error = function(e) {
        cat("✗ get_echarts() method failed:", e$message, "\n")
    }
)

# Test 5: Compare with old method
cat("\nTest 5: Comparing with original survey_plot_dispatch\n")
tryCatch(
    {
        p5 <- survey_plot_dispatch("ggplot", question_1_typed)
        cat("✓ Original survey_plot_dispatch still works - created:", class(p5)[1], "\n")
    },
    error = function(e) {
        cat("✗ Original survey_plot_dispatch failed:", e$message, "\n")
    }
)

# Test 6: Test error handling
cat("\nTest 6: Testing error handling\n")

# Create a question without tipus
question_no_type <- survey_obj$questions[[2]]
if (is.null(question_no_type$tipus)) {
    tryCatch(
        {
            plot(question_no_type)
            cat("✗ Should have failed for question without tipus\n")
        },
        error = function(e) {
            cat("✓ Correctly failed for question without tipus:", e$message, "\n")
        }
    )
}

cat("\nAll tests completed!\n")
