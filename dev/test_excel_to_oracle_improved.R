# Test the improved generate_oracle_insert_sql_from_excel function
# This script tests the template validation and error handling

# Load the function directly since package may not be installed
source("R/excel_to_oracle_sql.R")
library(dplyr)

# Load required packages
if (!requireNamespace("readxl", quietly = TRUE)) {
    stop("Package 'readxl' is required for this test")
}
if (!requireNamespace("whisker", quietly = TRUE)) {
    stop("Package 'whisker' is required for this test")
}
if (!requireNamespace("openxlsx", quietly = TRUE)) {
    stop("Package 'openxlsx' is required for this test")
}

# Create test data
test_data <- data.frame(
    id = 1:5,
    name = c("Alice", "Bob", "Charlie", "Diana", "Eve"),
    age = c(25, 30, 35, 28, 32),
    salary = c(50000, 60000, 70000, 55000, 65000),
    start_date = as.Date(c("2020-01-15", "2019-03-20", "2018-07-10", "2021-05-05", "2020-11-30"))
)

# Create temporary Excel file
temp_excel <- tempfile(fileext = ".xlsx")
if (requireNamespace("openxlsx", quietly = TRUE)) {
    openxlsx::write.xlsx(test_data, temp_excel)

    cat("=== Testing Template Validation ===\n")

    # Test 1: Default template (should work)
    cat("Test 1: Using default template...\n")
    tryCatch(
        {
            output_sql <- "dev/insert_all_template_output.sql"
            result <- generate_oracle_insert_sql_from_excel(
                excel_path = "inst/extdata/mock_lista.xlsx",
                sheet = 1,
                table_name = "EMPLOYEES",
                out_sql = output_sql
            )
            cat("✓ Default template validation passed\n")
            cat("Generated SQL file:", result, "\n")

            # Show first few lines of generated SQL
            sql_content <- readLines(result, n = 10)
            cat("First 10 lines of generated SQL:\n")
            cat(paste(sql_content, collapse = "\n"), "\n")
        },
        error = function(e) {
            cat("✗ Default template test failed:", e$message, "\n")
        }
    )

    # Test 2: Invalid template path
    cat("Test 2: Invalid template path...\n")
    tryCatch(
        {
            output_sql2 <- tempfile(fileext = ".sql")
            generate_oracle_insert_sql_from_excel(
                excel_path = temp_excel,
                sheet = 1,
                table_name = "EMPLOYEES",
                out_sql = output_sql2,
                template_path = "nonexistent_template.sql"
            )
            cat("✗ Should have failed with invalid template\n")
        },
        error = function(e) {
            cat("✓ Correctly caught invalid template error:", e$message, "\n")
        }
    )

    # Test 3: Invalid template content
    cat("Test 3: Invalid template content...\n")
    bad_template <- tempfile(fileext = ".sql")
    cat("This is not a valid Mustache template", file = bad_template)

    tryCatch(
        {
            output_sql3 <- tempfile(fileext = ".sql")
            generate_oracle_insert_sql_from_excel(
                excel_path = temp_excel,
                sheet = 1,
                table_name = "EMPLOYEES",
                out_sql = output_sql3,
                template_path = bad_template
            )
            cat("✗ Should have failed with invalid template content\n")
        },
        error = function(e) {
            cat("✓ Correctly caught invalid template content:", e$message, "\n")
        }
    )

    # Test 4: Valid custom template
    cat("Test 4: Valid custom template...\n")
    custom_template <- tempfile(fileext = ".sql")
    custom_content <- "-- Custom template: {{comment}}
INSERT /*+ append */ ALL
{{#rows}}
  INTO {{table}} ({{col_list}}) VALUES {{values}}
{{/rows}}
SELECT 1 FROM DUAL;"

    cat(custom_content, file = custom_template)

    tryCatch(
        {
            output_sql4 <- tempfile(fileext = ".sql")
            result4 <- generate_oracle_insert_sql_from_excel(
                excel_path = temp_excel,
                sheet = 1,
                table_name = "EMPLOYEES",
                out_sql = output_sql4,
                template_path = custom_template
            )
            cat("✓ Custom template validation passed\n")
        },
        error = function(e) {
            cat("Template validation message:", e$message, "\n")
        }
    )

    # Test 5: Test with index creation
    cat("Test 5: With index creation...\n")
    tryCatch(
        {
            output_sql5 <- tempfile(fileext = ".sql")
            result5 <- generate_oracle_insert_sql_from_excel(
                excel_path = temp_excel,
                sheet = 1,
                table_name = "EMPLOYEES",
                out_sql = output_sql5,
                index_col = "id",
                index_name = "PK_EMPLOYEES"
            )
            cat("✓ Index creation test passed\n")

            # Show the SQL with index
            sql_with_index <- readLines(result5)
            index_lines <- grep("CREATE INDEX", sql_with_index, value = TRUE)
            if (length(index_lines) > 0) {
                cat("Index creation SQL:", index_lines[1], "\n")
            }
        },
        error = function(e) {
            cat("✗ Index creation test failed:", e$message, "\n")
        }
    )

    # Clean up
    unlink(c(temp_excel, bad_template, custom_template))
} else {
    cat("openxlsx package not available for testing\n")
}

cat("\n=== Template Validation Tests Complete ===\n")

# Test the template validation function directly
cat("\n=== Direct Template Validation Tests ===\n")

# Test valid template
cat("Testing valid template content...\n")
valid_template <- "INSERT ALL {{#rows}} INTO {{table}} ({{col_list}}) VALUES {{values}} {{/rows}} SELECT 1 FROM DUAL;"
tryCatch(
    {
        .validate_template_content(valid_template, "test_template")
        cat("✓ Valid template passed validation\n")
    },
    error = function(e) {
        cat("✗ Valid template failed:", e$message, "\n")
    }
)

# Test invalid template
cat("Testing invalid template content...\n")
invalid_template <- "INSERT INTO some_table VALUES (1, 2, 3);"
tryCatch(
    {
        .validate_template_content(invalid_template, "bad_template")
        cat("✗ Invalid template should have failed\n")
    },
    error = function(e) {
        cat("✓ Invalid template correctly rejected:", e$message, "\n")
    }
)
