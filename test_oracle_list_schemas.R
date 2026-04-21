# Test script for oracle_list_schemas function

# Load the package
devtools::load_all()

cat("\n=== Testing oracle_list_schemas() ===\n\n")

# Test 1: Basic usage - auto-create connection
cat("Test 1: Calling oracle_list_schemas() without parameters...\n")
tryCatch({
  schemas <- oracle_list_schemas()
  cat("✓ Success! Found", length(schemas), "schemas\n")
  cat("First 10 schemas:\n")
  print(head(schemas, 10))
}, error = function(e) {
  cat("✗ Error:", e$message, "\n")
})

# Test 2: With explicit connection
cat("\n\nTest 2: Calling oracle_list_schemas() with explicit connection...\n")
tryCatch({
  con <- oracle_connect("RFLOW")
  schemas <- oracle_list_schemas(connection = con)
  cat("✓ Success! Found", length(schemas), "schemas\n")
  cat("Total schemas:", length(schemas), "\n")
  cat("Sample schemas (sorted alphabetically):\n")
  print(head(schemas, 15))
  
  # Verify it's sorted
  if (identical(schemas, sort(schemas))) {
    cat("\n✓ Schemas are properly sorted alphabetically\n")
  } else {
    cat("\n✗ Warning: Schemas are not properly sorted\n")
  }
}, error = function(e) {
  cat("✗ Error:", e$message, "\n")
})

cat("\n=== Test Complete ===\n")
