#' Query all data from a table with security checks
#'
#' @title Secure table query wrapper
#' @description
#' `oracle_select_all()` provides a secure wrapper around DBI::dbGetQuery to select
#' all data from a specified table. It includes validation for connection status,
#' table existence, and protection against SQL injection attacks.
#'
#' @param connection A valid database connection object (e.g., from oracle_connect())
#' @param table_name Character string. Name of the table to query. Must be a valid
#'   table name containing only alphanumeric characters, underscores, and dots.
#' @param schema Character string, optional. Schema name if different from connection default.
#'   If provided, must also be a valid schema name.
#'
#' @returns A data frame containing all rows and columns from the specified table.
#'
#' @importFrom DBI dbIsValid dbGetQuery dbExistsTable dbQuoteIdentifier
#' @importFrom stringr str_detect
#'
#' @export
oracle_select_all <- function(connection, table_name, schema = NULL) {
    # Validate inputs
    if (missing(connection) || is.null(connection)) {
        stop("Connection parameter is required and cannot be NULL.")
    }

    if (missing(table_name) || is.null(table_name) || nchar(trimws(table_name)) == 0) {
        stop("Table name is required and cannot be empty.")
    }

    # Check if connection is valid
    if (!DBI::dbIsValid(connection)) {
        stop("Database connection is not valid. Please check your connection.")
    }

    # Sanitize table name to prevent SQL injection
    # Allow only alphanumeric characters, underscores, and dots
    table_name <- trimws(table_name)
    if (!stringr::str_detect(table_name, "^[a-zA-Z0-9_\\.]+$")) {
        stop("Invalid table name. Table names can only contain letters, numbers, underscores, and dots.")
    }

    # Sanitize schema name if provided
    if (!is.null(schema)) {
        schema <- trimws(schema)
        if (nchar(schema) == 0) {
            schema <- NULL
        } else if (!stringr::str_detect(schema, "^[a-zA-Z0-9_\\.]+$")) {
            stop("Invalid schema name. Schema names can only contain letters, numbers, underscores, and dots.")
        }
    }

    # Create full table identifier
    if (!is.null(schema)) {
        full_table_name <- paste(schema, table_name, sep = ".")
    } else {
        full_table_name <- table_name
    }

    # Check if table exists
    table_exists <- tryCatch(
        {
            if (!is.null(schema)) {
                DBI::dbExistsTable(connection, DBI::Id(schema = schema, table = table_name))
            } else {
                DBI::dbExistsTable(connection, table_name)
            }
        },
        error = function(e) {
            # If dbExistsTable fails, try alternative method
            tryCatch(
                {
                    # Try to query the table with LIMIT 0 to check existence
                    if (!is.null(schema)) {
                        test_query <- paste0(
                            "SELECT * FROM ",
                            DBI::dbQuoteIdentifier(connection, schema), ".",
                            DBI::dbQuoteIdentifier(connection, table_name),
                            " WHERE ROWNUM = 0"
                        )
                    } else {
                        test_query <- paste0(
                            "SELECT * FROM ",
                            DBI::dbQuoteIdentifier(connection, table_name),
                            " WHERE ROWNUM = 0"
                        )
                    }
                    DBI::dbGetQuery(connection, test_query)
                    return(TRUE)
                },
                error = function(e2) {
                    return(FALSE)
                }
            )
        }
    )

    if (!table_exists) {
        if (!is.null(schema)) {
            stop(paste0("Table '", table_name, "' does not exist in schema '", schema, "'."))
        } else {
            stop(paste0("Table '", table_name, "' does not exist in the current schema."))
        }
    }

    # Build secure query using DBI::dbQuoteIdentifier for proper quoting
    if (!is.null(schema)) {
        query <- paste0(
            "SELECT * FROM ",
            DBI::dbQuoteIdentifier(connection, schema), ".",
            DBI::dbQuoteIdentifier(connection, table_name)
        )
    } else {
        query <- paste0(
            "SELECT * FROM ",
            DBI::dbQuoteIdentifier(connection, table_name)
        )
    }

    # Execute query with error handling
    result <- tryCatch(
        {
            DBI::dbGetQuery(connection, query)
        },
        error = function(e) {
            stop(paste0("Error executing query: ", e$message))
        }
    )

    # Log successful query
    message(paste0("Successfully retrieved ", nrow(result), " rows from table '", full_table_name, "'."))

    return(result)
}

#' List all tables in the current schema
#'
#' @title List available tables
#' @description
#' `oracle_list_tables()` returns a list of all tables available in the current
#' schema or a specified schema.
#'
#' @param connection A valid database connection object
#' @param schema Character string, optional. Schema name to list tables from.
#'   If NULL, lists tables from the current schema.
#'
#' @returns A character vector of table names.
#'
#' @importFrom DBI dbIsValid dbListTables
#'
#' @export
oracle_list_tables <- function(connection, schema = NULL) {
    # Validate connection
    if (missing(connection) || is.null(connection)) {
        stop("Connection parameter is required and cannot be NULL.")
    }

    if (!DBI::dbIsValid(connection)) {
        stop("Database connection is not valid. Please check your connection.")
    }

    # Get table list
    tables <- tryCatch(
        {
            if (!is.null(schema)) {
                # Sanitize schema name
                schema <- trimws(schema)
                if (!stringr::str_detect(schema, "^[a-zA-Z0-9_\\.]+$")) {
                    stop("Invalid schema name. Schema names can only contain letters, numbers, underscores, and dots.")
                }
                DBI::dbListTables(connection, schema = schema)
            } else {
                DBI::dbListTables(connection)
            }
        },
        error = function(e) {
            stop(paste0("Error listing tables: ", e$message))
        }
    )

    return(tables)
}

#' Check if a table exists in the schema
#'
#' @title Check table existence
#' @description
#' `oracle_table_exists()` checks if a specified table exists in the current
#' schema or a specified schema.
#'
#' @param connection A valid database connection object
#' @param table_name Character string. Name of the table to check.
#' @param schema Character string, optional. Schema name to check in.
#'
#' @returns Logical. TRUE if table exists, FALSE otherwise.
#'
#' @importFrom DBI dbIsValid dbExistsTable
#' @importFrom stringr str_detect
#'
#' @export
oracle_table_exists <- function(connection, table_name, schema = NULL) {
    # Validate inputs
    if (missing(connection) || is.null(connection)) {
        stop("Connection parameter is required and cannot be NULL.")
    }

    if (missing(table_name) || is.null(table_name) || nchar(trimws(table_name)) == 0) {
        stop("Table name is required and cannot be empty.")
    }

    if (!DBI::dbIsValid(connection)) {
        stop("Database connection is not valid. Please check your connection.")
    }

    # Sanitize table name
    table_name <- trimws(table_name)
    if (!stringr::str_detect(table_name, "^[a-zA-Z0-9_\\.]+$")) {
        stop("Invalid table name. Table names can only contain letters, numbers, underscores, and dots.")
    }

    # Sanitize schema name if provided
    if (!is.null(schema)) {
        schema <- trimws(schema)
        if (nchar(schema) == 0) {
            schema <- NULL
        } else if (!stringr::str_detect(schema, "^[a-zA-Z0-9_\\.]+$")) {
            stop("Invalid schema name. Schema names can only contain letters, numbers, underscores, and dots.")
        }
    }

    # Check table existence
    exists <- tryCatch(
        {
            if (!is.null(schema)) {
                DBI::dbExistsTable(connection, DBI::Id(schema = schema, table = table_name))
            } else {
                DBI::dbExistsTable(connection, table_name)
            }
        },
        error = function(e) {
            FALSE
        }
    )

    return(exists)
}
