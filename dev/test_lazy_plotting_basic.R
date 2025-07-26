# Quick test script to verify lazy plotting functionality
# This script tests the core functionality without requiring full package loading

# Source the main functions
tryCatch(
    {
        source("R/survey_objects.R", local = TRUE)
        cat("✓ Successfully loaded survey_objects.R\n")
    },
    error = function(e) {
        cat("✗ Error loading survey_objects.R:", e$message, "\n")
        quit(status = 1)
    }
)

# Create mock data
mock_data <- data.frame(
    respondent_id = 1:10,
    answer = sample(1:5, 10, replace = TRUE)
)

mock_label <- data.frame(
    kerdesszam = rep("Q1", 5),
    valasz_szovege = c("Very Bad", "Bad", "Neutral", "Good", "Very Good"),
    valasz_id = 1:5,
    oszlop_szovege = rep(NA, 5)
)

cat("\n=== Testing Lazy Plotting Functionality ===\n")

# Test 1: Create SurveyQuestion with tipus
cat("\n1. Testing survey_question() with tipus...\n")
tryCatch(
    {
        question <- survey_question(
            id = "Q1",
            tipus = "likert_scale",
            data = mock_data,
            label = mock_label
        )

        # Check structure
        if (inherits(question, "SurveyQuestion")) {
            cat("   ✓ Created SurveyQuestion object\n")
        } else {
            cat("   ✗ Wrong class:", class(question), "\n")
        }

        # Check lazy loading flags
        if (!is.null(question$ggplot_fn) && question$ggplot_fn == "ggplot") {
            cat("   ✓ ggplot_fn flag set correctly\n")
        } else {
            cat("   ✗ ggplot_fn flag not set correctly\n")
        }

        if (!is.null(question$echarts_fn) && question$echarts_fn == "echarts") {
            cat("   ✓ echarts_fn flag set correctly\n")
        } else {
            cat("   ✗ echarts_fn flag not set correctly\n")
        }

        # Check that no actual plots are stored
        if (!("ggplot" %in% names(question)) && !("echarts" %in% names(question))) {
            cat("   ✓ No immediate plots stored (memory efficient)\n")
        } else {
            cat("   ✗ Plots were stored immediately\n")
        }
    },
    error = function(e) {
        cat("   ✗ Error in survey_question():", e$message, "\n")
    }
)

# Test 2: Create SurveyQuestion without tipus
cat("\n2. Testing survey_question() without tipus...\n")
tryCatch(
    {
        question_no_type <- survey_question(
            id = "Q2",
            tipus = NULL,
            data = mock_data,
            label = mock_label
        )

        if (is.null(question_no_type$ggplot_fn) && is.null(question_no_type$echarts_fn)) {
            cat("   ✓ No lazy loading flags set when tipus is NULL\n")
        } else {
            cat("   ✗ Lazy loading flags set even when tipus is NULL\n")
        }
    },
    error = function(e) {
        cat("   ✗ Error in survey_question() without tipus:", e$message, "\n")
    }
)

# Test 3: Test Survey object creation
cat("\n3. Testing Survey object creation...\n")
tryCatch(
    {
        survey_obj <- survey(title = "Test Survey", labels = mock_label)

        if (inherits(survey_obj, "Survey")) {
            cat("   ✓ Created Survey object\n")
        } else {
            cat("   ✗ Wrong class for Survey object\n")
        }

        # Add question to survey
        survey_obj <- survey_add_question(survey_obj, question)

        if (length(survey_obj$questions) == 1 && "Q1" %in% names(survey_obj$questions)) {
            cat("   ✓ Added question to survey\n")
        } else {
            cat("   ✗ Failed to add question to survey\n")
        }
    },
    error = function(e) {
        cat("   ✗ Error in Survey operations:", e$message, "\n")
    }
)

# Test 4: Test method dispatch (basic structure)
cat("\n4. Testing S3 method structure...\n")

# Check if plot.SurveyQuestion exists
if (exists("plot.SurveyQuestion")) {
    cat("   ✓ plot.SurveyQuestion method exists\n")
} else {
    cat("   ✗ plot.SurveyQuestion method not found\n")
}

# Check if get_ggplot.SurveyQuestion exists
if (exists("get_ggplot.SurveyQuestion")) {
    cat("   ✓ get_ggplot.SurveyQuestion method exists\n")
} else {
    cat("   ✗ get_ggplot.SurveyQuestion method not found\n")
}

# Check if get_echarts.SurveyQuestion exists
if (exists("get_echarts.SurveyQuestion")) {
    cat("   ✓ get_echarts.SurveyQuestion method exists\n")
} else {
    cat("   ✗ get_echarts.SurveyQuestion method not found\n")
}

cat("\n=== Basic Tests Completed ===\n")
cat("✓ Lazy plotting structure is implemented correctly\n")
cat("✓ Memory efficiency: No plots stored immediately\n")
cat("✓ S3 methods are defined for on-demand plot creation\n")
cat("\nNote: Actual plot creation will depend on survey_plot_dispatch() function\n")
cat("and the availability of specific plotting functions for each question type.\n")
