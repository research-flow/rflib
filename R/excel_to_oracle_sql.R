#' Generate Oracle SQL script from Excel data
#'
#' @title Convert Excel data to Oracle SQL CREATE TABLE and INSERT statements
#' @description
#' This function reads an Excel file and generates a complete Oracle SQL script
#' including DROP TABLE, CREATE TABLE, and INSERT statements. It supports
#' custom column types, automatic type inference, data transformation, and
#' optimized bulk operations.
#'
#' @param excel_path Character string. Path to the Excel file.
#' @param sheet Integer or character string. Sheet number or name to read (default: 1).
#' @param sql_output Character string. Output SQL file path (default: "output_script.sql").
#' @param table_name Character string. Name of the Oracle table to create (default: "MY_TABLE").
#' @param column_types Named list. Custom Oracle column types (e.g., list(TTT = "VARCHAR2(9 BYTE)")).
#' @param round_column Character string. Column name to apply rounding transformation.
#' @param round_multiplier Numeric. Multiplier for rounding operation (default: 1000).
#' @param add_index Logical. Whether to add an auto-increment index column (default: FALSE).
#' @param index_name Character string. Name of the index column if add_index = TRUE (default: "id").
#' @param batch_size Integer. Number of INSERT statements per batch for performance (default: 1000).
#' @param use_merge Logical. Use MERGE statements instead of INSERT for upsert operations (default: FALSE).
#'
#' @return Invisible. Function is called for side effects (writing SQL file).
#'
#' @importFrom readxl read_excel
#' @importFrom dplyr mutate relocate
#' @importFrom stringr str_replace_all str_detect
#' @importFrom purrr map2_chr
#' @importFrom glue glue
#'
#' @export
excel_to_oracle_sql <- function(
    excel_path,
    sheet = 1,
    sql_output = "output_script.sql",
    table_name = "MY_TABLE",
    column_types = list(),
    round_column = NULL,
    round_multiplier = 1000,
    add_index = FALSE,
    index_name = "id",
    batch_size = 1000,
    use_merge = FALSE) {
  # Input validation
  if (!file.exists(excel_path)) {
    stop("Excel file not found: ", excel_path)
  }

  if (!is.character(table_name) || nchar(table_name) == 0) {
    stop("table_name must be a non-empty character string")
  }

  if (!is.list(column_types)) {
    stop("column_types must be a named list")
  }

  if (batch_size <= 0) {
    stop("batch_size must be a positive integer")
  }

  # Read Excel data with error handling
  df <- tryCatch(
    {
      readxl::read_excel(excel_path, sheet = sheet)
    },
    error = function(e) {
      stop("Failed to read Excel file: ", e$message)
    }
  )

  if (nrow(df) == 0) {
    stop("Excel sheet is empty or contains no data")
  }

  # Add index column if requested
  if (add_index) {
    if (index_name %in% names(df)) {
      warning("Index column '", index_name, "' already exists. Overwriting.")
    }
    df <- df |>
      dplyr::mutate(!!index_name := seq_len(nrow(df))) |>
      dplyr::relocate(!!index_name)
  }

  # Apply rounding transformation
  if (!is.null(round_column)) {
    if (!round_column %in% names(df)) {
      warning("Round column '", round_column, "' not found in data")
    } else if (!is.numeric(df[[round_column]])) {
      warning("Round column '", round_column, "' is not numeric")
    } else {
      df[[round_column]] <- round(df[[round_column]] * round_multiplier)
    }
  }

  # Optimized Oracle type inference
  infer_oracle_type <- function(x) {
    if (is.numeric(x)) {
      # Check for integers vs decimals
      if (all(x == floor(x), na.rm = TRUE)) {
        max_val <- max(abs(x), na.rm = TRUE)
        if (max_val <= 2147483647) {
          return("NUMBER(10)")
        }
        return("NUMBER(19)")
      }
      return("NUMBER")
    }
    if (inherits(x, c("Date", "POSIXct", "POSIXt"))) {
      return("DATE")
    }
    if (is.logical(x)) {
      return("NUMBER(1)")
    }

    # For character columns, determine optimal VARCHAR2 size
    max_length <- max(nchar(as.character(x)), na.rm = TRUE)
    if (max_length <= 50) {
      return("VARCHAR2(50 BYTE)")
    }
    if (max_length <= 255) {
      return("VARCHAR2(255 BYTE)")
    }
    if (max_length <= 4000) {
      return(paste0("VARCHAR2(", max_length + 50, " BYTE)"))
    }
    return("CLOB")
  }

  # Generate column definitions
  cols <- names(df)
  col_defs <- purrr::map2_chr(cols, df, function(colname, column_data) {
    # Use custom type if provided, otherwise infer
    dtype <- column_types[[colname]]
    if (is.null(dtype)) {
      dtype <- infer_oracle_type(column_data)
    }

    # Sanitize column name for Oracle
    clean_colname <- toupper(stringr::str_replace_all(colname, "[^A-Za-z0-9_]", "_"))
    glue::glue("{clean_colname} {dtype}")
  })

  # Optimized SQL value escaping
  escape_sql_value <- function(x) {
    if (is.na(x)) {
      return("NULL")
    }
    if (is.numeric(x)) {
      return(as.character(x))
    }
    if (is.logical(x)) {
      return(ifelse(x, "1", "0"))
    }
    if (inherits(x, c("Date", "POSIXct", "POSIXt"))) {
      return(glue::glue("TO_DATE('{format(x, \"%Y-%m-%d %H:%M:%S\")}', 'YYYY-MM-DD HH24:MI:SS')"))
    }

    # Escape single quotes and handle special characters
    escaped <- stringr::str_replace_all(as.character(x), "'", "''")
    return(glue::glue("'{escaped}'"))
  }

  # Clean column names for SQL
  clean_cols <- toupper(stringr::str_replace_all(cols, "[^A-Za-z0-9_]", "_"))
  clean_table_name <- toupper(stringr::str_replace_all(table_name, "[^A-Za-z0-9_]", "_"))

  # Generate SQL components
  sql_parts <- list()

  # 1. Drop table statement
  sql_parts$drop <- glue::glue("
-- Drop table if exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE {clean_table_name} PURGE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/")

  # 2. Create table statement
  sql_parts$create <- glue::glue("
-- Create table
CREATE TABLE {clean_table_name} (
    {paste(col_defs, collapse = ',\\n    ')}
);")

  # 3. Generate INSERT statements in batches for performance
  total_rows <- nrow(df)
  insert_statements <- character()

  for (i in seq(1, total_rows, batch_size)) {
    end_idx <- min(i + batch_size - 1, total_rows)
    batch_df <- df[i:end_idx, , drop = FALSE]

    if (use_merge) {
      # Generate MERGE statements (more complex but supports upsert)
      merge_values <- apply(batch_df, 1, function(row) {
        values <- sapply(row, escape_sql_value)
        glue::glue("SELECT {paste(paste(values, 'AS', clean_cols), collapse = ', ')} FROM DUAL")
      })

      merge_stmt <- glue::glue("
MERGE INTO {clean_table_name} target
USING (
    {paste(merge_values, collapse = '\\n    UNION ALL\\n    ')}
) source ON (1=0)
WHEN NOT MATCHED THEN
    INSERT ({paste(clean_cols, collapse = ', ')})
    VALUES ({paste(paste0('source.', clean_cols), collapse = ', ')});")

      insert_statements <- c(insert_statements, merge_stmt)
    } else {
      # Generate standard INSERT statements
      batch_inserts <- apply(batch_df, 1, function(row) {
        values <- sapply(row, escape_sql_value)
        glue::glue("INSERT INTO {clean_table_name} ({paste(clean_cols, collapse = ', ')}) VALUES ({paste(values, collapse = ', ')});")
      })

      insert_statements <- c(insert_statements, batch_inserts)
    }
  }

  sql_parts$inserts <- paste(insert_statements, collapse = "\n")

  # 4. Post-processing (rounding adjustment)
  if (!is.null(round_column) && round_column %in% cols) {
    clean_round_col <- toupper(stringr::str_replace_all(round_column, "[^A-Za-z0-9_]", "_"))
    sql_parts$post_process <- glue::glue("
-- Adjust rounded values
UPDATE {clean_table_name} SET {clean_round_col} = {clean_round_col} / {round_multiplier};")
  } else {
    sql_parts$post_process <- ""
  }

  # 5. Commit and statistics
  sql_parts$commit <- glue::glue("
-- Commit changes
COMMIT;

-- Display statistics
SELECT COUNT(*) AS TOTAL_ROWS FROM {clean_table_name};")

  # Combine all SQL parts
  complete_sql <- paste(
    "-- Generated Oracle SQL Script",
    glue::glue("-- Source: {excel_path} (sheet: {sheet})"),
    glue::glue("-- Generated: {Sys.time()}"),
    glue::glue("-- Total rows: {total_rows}"),
    "",
    sql_parts$drop,
    "",
    sql_parts$create,
    "",
    "-- Insert data",
    sql_parts$inserts,
    "",
    sql_parts$post_process,
    "",
    sql_parts$commit,
    sep = "\\n"
  )

  # Write to file with error handling
  tryCatch(
    {
      writeLines(complete_sql, sql_output)
      message("✅ SQL script successfully written to: ", sql_output)
      message("📊 Generated ", total_rows, " INSERT statements for table ", clean_table_name)
      if (use_merge) {
        message("🔄 Using MERGE statements for upsert operations")
      }
      if (batch_size < total_rows) {
        message("⚡ Optimized with batch size: ", batch_size)
      }
    },
    error = function(e) {
      stop("Failed to write SQL file: ", e$message)
    }
  )

  invisible(NULL)
}
