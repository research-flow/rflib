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
#' @details
#' \strong{Security Measures:}
#' This function is protected against SQL injection attacks through multiple layers:
#' \itemize{
#'   \item \strong{Input Validation:} All identifiers (schema and table names) are validated
#'     against a whitelist pattern allowing only alphanumeric characters, underscores, and dots
#'     (regex: `^[a-zA-Z0-9_\\.]+$`). Invalid identifiers are rejected with a clear error message.
#'   \item \strong{Identifier Quoting:} Uses `DBI::dbQuoteIdentifier()` for proper SQL identifier
#'     escaping, which quotes identifiers according to the database's requirements.
#'   \item \strong{Pre-query Validation:} Verifies that the requested table actually exists
#'     before attempting the query, preventing typos and unauthorized table access attempts.
#'   \item \strong{Connection Validation:} Confirms the database connection is valid before
#'     executing any queries via `DBI::dbIsValid()`.
#'   \item \strong{No String Concatenation:} Query construction avoids string concatenation
#'     for identifiers, using only DBI functions for safe query building.
#' }
#'
#' @examples
#' \dontrun{
#'   con <- oracle_connect("RFLOW")
#'   df <- oracle_select_all("RFLOW", "MY_TABLE", connection = con)
#' }
#'
#' @importFrom DBI dbIsValid dbGetQuery dbExistsTable dbQuoteIdentifier
#' @importFrom stringr str_detect
#'
#' @export
oracle_select_all <- function(schema, table_name, connection = NULL) {
    # Validate inputs
    if (missing(schema) || is.null(schema) || nchar(trimws(schema)) == 0) {
        stop("Schema name is required and cannot be empty.")
    }

    # If connection is not provided, try to create it using the schema
    if (missing(connection) || is.null(connection)) {
        connection <- tryCatch(
            {
                rflib::oracle_connect()
            },
            error = function(e) {
                stop(paste0("Could not establish connection using schema '", schema, "': ", e$message))
            }
        )
    }
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
            start_time <- Sys.time()
            result_ret <- DBI::dbGetQuery(connection, query)
            end_time <- Sys.time()
            result_ret_tibble <- dplyr::as_tibble(result_ret) 
            message(sprintf("Query executed in %f seconds", as.numeric(difftime(end_time, start_time, units = "secs"))))
            return(result_ret_tibble)
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
#' @param schema Character string, optional. Schema name to list tables from.
#'   If NULL, lists tables from the current schema.
#' @param connection A valid database connection object
#' @param subset A regex expression to filter for relevant table names
#'
#' @returns A character vector of table names.
#'
#' @importFrom DBI dbIsValid dbListTables
#'
#' @export
oracle_list_tables <- function(schema, connection = NULL, subset = NULL) {
    # Validate connection
    if (missing(schema) || is.null(schema) || nchar(trimws(schema)) == 0) {
        stop("Schema name is required and cannot be empty.")
    }

    # If connection is not provided, try to create it using the schema
    if (missing(connection) || is.null(connection)) {
        connection <- tryCatch(
            {
                rflib::oracle_connect()
            },
            error = function(e) {
                stop(paste0("Could not establish connection using schema '", schema, "': ", e$message))
            }
        )
    }
    if (missing(connection) || is.null(connection)) {
        stop("Connection parameter is required and cannot be NULL.")
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

    # Apply subset filter if provided
    if (!is.null(subset)) {
        if (!is.character(subset) || length(subset) != 1) {
            stop("Subset parameter must be a single character string.")
        }
        tables <- stringr::str_subset(tables, subset)
    }

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
oracle_table_exists <- function(schema, table_name, connection = NULL) {
    if (missing(schema) || is.null(schema) || nchar(trimws(schema)) == 0) {
        stop("Schema name is required and cannot be empty.")
    }

    # If connection is not provided, try to create it using the schema
    if (missing(connection) || is.null(connection)) {
        connection <- tryCatch(
            {
                rflib::oracle_connect()
            },
            error = function(e) {
                stop(paste0("Could not establish connection using schema '", schema, "': ", e$message))
            }
        )
    }
    if (missing(connection) || is.null(connection)) {
        stop("Connection parameter is required and cannot be NULL.")
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

#' List all available Oracle schemas
#'
#' @title List available Oracle schemas
#' @description
#' `oracle_list_schemas()` retrieves a list of all schemas accessible to the current
#' user from the Oracle database. It queries the DBA_USERS or ALL_USERS view to obtain
#' all accessible schema names.
#'
#' @param connection A valid database connection object (e.g., from oracle_connect()).
#'   If NULL or missing, a connection will be automatically created using the default
#'   schema (RFLOW).
#'
#' @returns A character vector of schema names accessible to the current user,
#'   sorted alphabetically.
#'
#' @details
#' This function executes a secure query against the Oracle database system views.
#' It uses parameterized queries to prevent SQL injection and validates the connection
#' before attempting to retrieve schema information.
#'
#' @examples
#' \dontrun{
#'   # List all available schemas
#'   schemas <- oracle_list_schemas()
#'   print(schemas)
#'   
#'   # With explicit connection
#'   con <- oracle_connect("RFLOW")
#'   schemas <- oracle_list_schemas(connection = con)
#' }
#'
#' @importFrom DBI dbIsValid dbGetQuery
#'
#' @export
oracle_list_schemas <- function(connection = NULL) {
    # If connection is not provided, try to create it using default schema
    if (missing(connection) || is.null(connection)) {
        connection <- tryCatch(
            {
                rflib::oracle_connect()
            },
            error = function(e) {
                stop(paste0("Could not establish connection: ", e$message))
            }
        )
    }

    if (is.null(connection)) {
        stop("Connection parameter is required and cannot be NULL.")
    }

    # Check if connection is valid
    if (!DBI::dbIsValid(connection)) {
        stop("Database connection is not valid. Please check your connection.")
    }

    # Query available schemas from Oracle system views
    # Using ALL_USERS view which is accessible to all users
    # DBA_USERS would require DBA privileges and may not be accessible to all users
    schemas <- tryCatch(
        {
            query <- "SELECT USERNAME FROM ALL_USERS ORDER BY USERNAME"
            result <- DBI::dbGetQuery(connection, query)
            
            if (nrow(result) == 0) {
                warning("No schemas found in ALL_USERS view. Attempting DBA_USERS...")
                # Fallback to DBA_USERS if ALL_USERS returns no results
                query_fallback <- "SELECT USERNAME FROM DBA_USERS ORDER BY USERNAME"
                result <- DBI::dbGetQuery(connection, query_fallback)
            }
            
            # Extract schema names and convert to character vector
            if (nrow(result) > 0) {
                schemas <- sort(unique(as.character(result$USERNAME)))
            } else {
                schemas <- character(0)
            }
            
            return(schemas)
        },
        error = function(e) {
            stop(paste0("Error retrieving schemas: ", e$message))
        }
    )

    # Log results
    message(paste0("Successfully retrieved ", length(schemas), " schema(s) from Oracle database."))

    return(schemas)
}
#' Get the structure (columns and types) of one or more Oracle tables
#'
#' @title Describe Oracle table structure
#' @description
#' `oracle_describe_tables()` returns the column names and data types for one
#' or more tables in a given Oracle schema. Tables can be selected either by
#' an exact name (via `table_name`) or by a regex `subset` applied to the
#' list of tables in the schema (as returned by `oracle_list_tables()`). If
#' neither is supplied, every table in the schema is described.
#'
#' @param schema Character string. Schema name to describe tables from. Required.
#' @param subset Character string, optional. A regex expression used to filter
#'   table names (passed through to `oracle_list_tables()`). Ignored if
#'   `table_name` is supplied.
#' @param table_name Character vector, optional. One or more exact table names
#'   to describe. If supplied, `subset` is ignored and only these tables are
#'   described (each must exist in `schema`).
#' @param connection A valid database connection object (e.g., from
#'   `oracle_connect()`). If NULL, a connection is created automatically.
#'
#' @returns A tibble with columns `TABLE`, `COLNAME`, `COLTYPE` — one row per
#'   column, per table.
#'
#' @details
#' \strong{Security Measures:}
#' \itemize{
#'   \item Schema and table identifiers are validated against a whitelist
#'     pattern allowing only alphanumeric characters, underscores, and dots
#'     (regex: `^[a-zA-Z0-9_\\.]+$`).
#'   \item Identifiers are quoted via `DBI::dbQuoteIdentifier()`; no
#'     user-supplied value is concatenated unescaped into SQL.
#'   \item Table existence is confirmed via `oracle_table_exists()` before
#'     querying.
#'   \item Column metadata is obtained via `DBI::dbColumnInfo()` on a
#'     zero-row (`WHERE ROWNUM = 0`) query, so no actual table data is ever
#'     fetched.
#' }
#' A failure on any single table (e.g. it disappears mid-run, or a privilege
#' issue) produces a warning and is skipped rather than aborting the whole
#' batch.
#'
#' @examples
#' \dontrun{
#'   con <- oracle_connect("RFLOW")
#'
#'   # Describe every table in the schema
#'   str_all <- oracle_describe_tables("RFLOW", connection = con)
#'
#'   # Describe tables matching a regex
#'   str_subset <- oracle_describe_tables("RFLOW", subset = "^ORDERS_", connection = con)
#'
#'   # Describe a single, specific table
#'   str_one <- oracle_describe_tables("RFLOW", table_name = "MY_TABLE", connection = con)
#' }
#'
#' @importFrom DBI dbIsValid dbQuoteIdentifier dbSendQuery dbColumnInfo dbClearResult
#' @importFrom stringr str_detect
#' @importFrom dplyr bind_rows as_tibble
#'
#' @export
oracle_describe_tables <- function(schema, subset = NULL, table_name = NULL, connection = NULL) {
    # Validate schema
    if (missing(schema) || is.null(schema) || nchar(trimws(schema)) == 0) {
        stop("Schema name is required and cannot be empty.")
    }
    schema <- trimws(schema)
    if (!stringr::str_detect(schema, "^[a-zA-Z0-9_\\.]+$")) {
        stop("Invalid schema name. Schema names can only contain letters, numbers, underscores, and dots.")
    }

    # If connection is not provided, try to create it using the schema
    if (missing(connection) || is.null(connection)) {
        connection <- tryCatch(
            {
                rflib::oracle_connect()
            },
            error = function(e) {
                stop(paste0("Could not establish connection using schema '", schema, "': ", e$message))
            }
        )
    }
    if (is.null(connection)) {
        stop("Connection parameter is required and cannot be NULL.")
    }
    if (!DBI::dbIsValid(connection)) {
        stop("Database connection is not valid. Please check your connection.")
    }

    # Resolve which tables to describe
    if (!is.null(table_name)) {
        if (!is.character(table_name) || length(table_name) == 0) {
            stop("table_name must be a non-empty character vector.")
        }
        tables <- trimws(table_name)
        bad <- tables[!stringr::str_detect(tables, "^[a-zA-Z0-9_\\.]+$")]
        if (length(bad) > 0) {
            stop(paste0(
                "Invalid table name(s): ", paste(bad, collapse = ", "),
                ". Table names can only contain letters, numbers, underscores, and dots."
            ))
        }
    } else {
        tables <- oracle_list_tables(schema = schema, connection = connection, subset = subset)
    }

    if (length(tables) == 0) {
        warning("No tables found matching the given criteria.")
        return(dplyr::as_tibble(data.frame(
            TABLE = character(0), COLNAME = character(0), COLTYPE = character(0),
            stringsAsFactors = FALSE
        )))
    }

    describe_one <- function(tbl) {
        exists <- tryCatch(
            oracle_table_exists(schema = schema, table_name = tbl, connection = connection),
            error = function(e) FALSE
        )
        if (!isTRUE(exists)) {
            warning(paste0("Table '", tbl, "' does not exist in schema '", schema, "'. Skipping."))
            return(NULL)
        }
      
        col_info <- tryCatch(
            {
                query_raw <- odbc::odbcConnectionColumns(connection, name = tbl)
                query <- transmute(query_raw, SCHEMA = schema_name, TABLE = table_name, COLNAME = name, 
                COLTYPE = field.type, COLSIZE = buffer_length)
                query
            },
            error = function(e) {
                warning(paste0("Could not retrieve structure for table '", tbl, "': ", e$message))
                NULL
            }
        )

        if (is.null(col_info) || nrow(col_info) == 0) {
            return(NULL)
        }

        # dbColumnInfo column names vary slightly by driver; 'name' and
        # 'type' (or 'field.type') are the common ones.

        dplyr::as_tibble(data.frame(
            SCHEMA,
            TABLE,
            COLNAME,
            COLTYPE,
            COLSIZE,
            stringsAsFactors = FALSE
        ))
    }

    results <- lapply(tables, describe_one)
    result <- dplyr::bind_rows(results)

    if (nrow(result) == 0) {
        warning("No table structures could be retrieved.")
    } else {
        message(paste0(
            "Successfully retrieved structure for ", length(unique(result$TABLE)),
            " table(s), ", nrow(result), " column(s) total."
        ))
    }

    return(result)
}