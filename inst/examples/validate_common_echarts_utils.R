# Quick validation script for common_echarts_utils
# This script can be run to verify the function works correctly

# Load required libraries (assuming they're installed)
if (!requireNamespace("echarts4r", quietly = TRUE)) {
  stop("echarts4r package is required but not installed")
}

# Create a simple test
test_basic_functionality <- function() {
  cat("Testing basic functionality...\n")
  
  # Create basic chart
  chart <- mtcars |>
    echarts4r::e_charts(mpg) |>
    echarts4r::e_scatter(hp)
  
  # Apply common utilities
  result <- common_echarts_utils(chart)
  
  # Check if result is valid
  if (inherits(result, "echarts4r")) {
    cat("✓ Function returns valid echarts4r object\n")
    return(TRUE)
  } else {
    cat("✗ Function did not return valid echarts4r object\n")
    return(FALSE)
  }
}

test_parameter_validation <- function() {
  cat("Testing parameter validation...\n")
  
  # Test invalid input
  tryCatch({
    common_echarts_utils("invalid_input")
    cat("✗ Should have failed with invalid input\n")
    return(FALSE)
  }, error = function(e) {
    if (grepl("Input must be an echarts4r object", e$message)) {
      cat("✓ Correctly validates input type\n")
      return(TRUE)
    } else {
      cat("✗ Unexpected error message\n")
      return(FALSE)
    }
  })
}

# Run tests if this script is executed directly
if (exists("common_echarts_utils")) {
  cat("Running validation tests for common_echarts_utils...\n\n")
  
  test1 <- test_basic_functionality()
  test2 <- test_parameter_validation()
  
  cat("\nValidation Summary:\n")
  if (test1 && test2) {
    cat("✓ All tests passed! Function is working correctly.\n")
  } else {
    cat("✗ Some tests failed. Please check the function implementation.\n")
  }
} else {
  cat("common_echarts_utils function not found. Please load the rflib package first.\n")
}
