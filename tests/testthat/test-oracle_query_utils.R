test_that("oracle_select_all validates inputs correctly", {
    # Test missing connection
    expect_error(
        oracle_select_all(table_name = "test_table"),
        "Connection parameter is required"
    )

    # Test NULL connection
    expect_error(
        oracle_select_all(NULL, "test_table"),
        "Connection parameter is required"
    )

    # Test missing table name
    expect_error(
        oracle_select_all("fake_connection"),
        "Table name is required"
    )

    # Test NULL table name
    expect_error(
        oracle_select_all("fake_connection", NULL),
        "Table name is required"
    )

    # Test empty table name
    expect_error(
        oracle_select_all("fake_connection", ""),
        "Table name is required"
    )

    # Test whitespace-only table name
    expect_error(
        oracle_select_all("fake_connection", "   "),
        "Table name is required"
    )
})

test_that("oracle_select_all prevents SQL injection", {
    # Test SQL injection attempts in table name
    expect_error(
        oracle_select_all("fake_connection", "users; DROP TABLE users;"),
        "Invalid table name"
    )

    expect_error(
        oracle_select_all("fake_connection", "users' OR '1'='1"),
        "Invalid table name"
    )

    expect_error(
        oracle_select_all("fake_connection", "users/*comment*/"),
        "Invalid table name"
    )

    expect_error(
        oracle_select_all("fake_connection", "users--comment"),
        "Invalid table name"
    )

    # Test SQL injection attempts in schema name
    expect_error(
        oracle_select_all("fake_connection", "users", "schema; DROP TABLE users;"),
        "Invalid schema name"
    )

    expect_error(
        oracle_select_all("fake_connection", "users", "schema' OR '1'='1"),
        "Invalid schema name"
    )
})

test_that("oracle_select_all accepts valid table names", {
    # These should not throw errors for table name validation
    # (though they will fail on connection validation)
    expect_error(oracle_select_all("fake_connection", "valid_table"),
        "Database connection is not valid",
        fixed = TRUE
    )

    expect_error(oracle_select_all("fake_connection", "VALID_TABLE"),
        "Database connection is not valid",
        fixed = TRUE
    )

    expect_error(oracle_select_all("fake_connection", "table123"),
        "Database connection is not valid",
        fixed = TRUE
    )

    expect_error(oracle_select_all("fake_connection", "schema.table"),
        "Database connection is not valid",
        fixed = TRUE
    )

    expect_error(oracle_select_all("fake_connection", "valid_table", "valid_schema"),
        "Database connection is not valid",
        fixed = TRUE
    )
})

test_that("oracle_list_tables validates inputs correctly", {
    # Test missing connection
    expect_error(
        oracle_list_tables(),
        "Connection parameter is required"
    )

    # Test NULL connection
    expect_error(
        oracle_list_tables(NULL),
        "Connection parameter is required"
    )

    # Test invalid connection
    expect_error(
        oracle_list_tables("fake_connection"),
        "Database connection is not valid"
    )
})

test_that("oracle_list_tables prevents SQL injection in schema", {
    # Test SQL injection attempts in schema name
    expect_error(
        oracle_list_tables("fake_connection", "schema; DROP TABLE users;"),
        "Invalid schema name"
    )

    expect_error(
        oracle_list_tables("fake_connection", "schema' OR '1'='1"),
        "Invalid schema name"
    )
})

test_that("oracle_table_exists validates inputs correctly", {
    # Test missing connection
    expect_error(
        oracle_table_exists(table_name = "test_table"),
        "Connection parameter is required"
    )

    # Test NULL connection
    expect_error(
        oracle_table_exists(NULL, "test_table"),
        "Connection parameter is required"
    )

    # Test missing table name
    expect_error(
        oracle_table_exists("fake_connection"),
        "Table name is required"
    )

    # Test NULL table name
    expect_error(
        oracle_table_exists("fake_connection", NULL),
        "Table name is required"
    )

    # Test empty table name
    expect_error(
        oracle_table_exists("fake_connection", ""),
        "Table name is required"
    )

    # Test invalid connection
    expect_error(
        oracle_table_exists("fake_connection", "valid_table"),
        "Database connection is not valid"
    )
})

test_that("oracle_table_exists prevents SQL injection", {
    # Test SQL injection attempts in table name
    expect_error(
        oracle_table_exists("fake_connection", "users; DROP TABLE users;"),
        "Invalid table name"
    )

    expect_error(
        oracle_table_exists("fake_connection", "users' OR '1'='1"),
        "Invalid table name"
    )

    # Test SQL injection attempts in schema name
    expect_error(
        oracle_table_exists("fake_connection", "users", "schema; DROP TABLE users;"),
        "Invalid schema name"
    )

    expect_error(
        oracle_table_exists("fake_connection", "users", "schema' OR '1'='1"),
        "Invalid schema name"
    )
})

# Integration tests (these would need a real database connection to run)
test_that("oracle functions work with real connection", {
    skip_if_not(
        exists("test_connection") && DBI::dbIsValid(test_connection),
        "No valid test database connection available"
    )

    # Test listing tables
    tables <- oracle_list_tables(test_connection)
    expect_true(is.character(tables))

    # Test checking table existence
    if (length(tables) > 0) {
        first_table <- tables[1]
        expect_true(oracle_table_exists(test_connection, first_table))
        expect_false(oracle_table_exists(test_connection, "non_existent_table_xyz"))

        # Test querying data
        data <- oracle_select_all(test_connection, first_table)
        expect_true(is.data.frame(data))
    }
})

# Mock tests for successful operations
test_that("oracle_select_all handles successful queries", {
    skip("Requires mocking DBI functions")

    # This test would require mocking DBI functions to simulate
    # successful database operations without needing a real connection
})
