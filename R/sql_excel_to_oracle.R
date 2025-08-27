#' Generate Oracle SQL from an Excel sheet (no DB execution)
#'
#' Reads an Excel worksheet and renders an Oracle-compatible `.sql` file using a
#' file-based template (Mustache via `{whisker}`). It emits batched
#' `INSERT /*+ append */ ALL ... SELECT 1 FROM DUAL;` blocks and can optionally
#' append a `CREATE INDEX` statement.
#'
#' @param excel_path Character scalar. Path to the input `.xlsx` file.
#' @param sheet Sheet name or index to read from `excel_path`.
#' @param table_name Character scalar. Target Oracle table name (optionally schema-qualified).
#' @param out_sql Character scalar. Output path for the generated `.sql` file.
#' @param template_path Optional character scalar. Path to a Mustache SQL template.
#'   If `NULL`, the function looks for `inst/templates/insert_all_template.sql`
#'   bundled with this package (via `system.file()`).
#' @param index_col Optional character scalar. Column name to index. If `NULL`, no index is generated.
#' @param index_name Optional character scalar. Explicit index name. If missing and
#'   `index_col` is provided, a name is auto-generated as
#'   `IX_<TABLE>_<COLUMN>` (non-alphanumerics replaced by `_`).
#' @param chunk_size Integer. Number of rows per `INSERT ALL` block. Default `500`.
#' @param comment Optional character scalar. A comment header injected into the SQL.
#'
#' @details
#' **Template contract** (Mustache):
#'
#' The template should reference:
#' - `{{comment}}`             – a header string
#' - `{{table}}`               – table name
#' - `{{col_list}}`            – comma-separated column list
#' - iterate `{{#rows}} ... {{/rows}}` with each row providing `{{values}}`
#' - `{{#create_index}} ... {{/create_index}}` block with `{{index_name}}`, `{{index_col}}`
#'
#' Example template (ship in `inst/templates/insert_all_template.sql`):
#' ```
#' -- {{comment}}
#' INSERT /*+ append */ ALL
#' {{#rows}}
#'   INTO {{table}} ({{col_list}}) VALUES {{values}}
#' {{/rows}}
#' SELECT 1 FROM DUAL;
#' {{#create_index}}
#'
#' -- Optional indexing
#' CREATE INDEX {{index_name}} ON {{table}} ({{index_col}});
#' {{/create_index}}
#' ```
#'
#' **Type handling:**
#' - `NA` → `NULL`
#' - `Date` → `DATE 'YYYY-MM-DD'`
#' - `POSIXct/POSIXt` → `TO_TIMESTAMP('YYYY-MM-DD HH24:MI:SS','YYYY-MM-DD HH24:MI:SS')`
#' - numeric → plain number (no scientific notation)
#' - logical → `1`/`0`
#' - character → single-quoted with single quotes doubled
#'
#' Columns whose names *look* like dates (e.g., `..._date`, `datum`, `..._dt`) are
#' lightly coerced from character to `Date` when possible.
#'
#' @return (Invisibly) `out_sql` path, after writing the file to disk.
#'
#' @export
generate_oracle_insert_sql_from_excel <- function(
    excel_path,
    sheet,
    table_name,
    out_sql,
    template_path = NULL,
    index_col = NULL,
    index_name = NULL,
    chunk_size = 500L,
    comment = NULL) {
  stopifnot(length(excel_path) == 1L, file.exists(excel_path))
  # Validate table name length for Oracle
  if (nchar(table_name) > 30) {
    stop("Table name '", table_name, "' exceeds Oracle's 30-character limit")
  }
  # Validate and locate template file
  if (is.null(template_path)) {
    # Get package name safely
    pkg_name <- tryCatch(utils::packageName(), error = function(e) "rflib")
    if (is.null(pkg_name)) pkg_name <- "rflib"

    # Try to find default template in package
    template_path <- system.file("templates", "insert_all_template.sql",
      package = pkg_name
    )

    # If not found in installed package, try inst directory (for development)
    if (!nzchar(template_path) || !file.exists(template_path)) {
      inst_template <- system.file("inst", "templates", "insert_all_template.sql",
        package = pkg_name
      )
      if (nzchar(inst_template) && file.exists(inst_template)) {
        template_path <- inst_template
      }
    }

    # If still not found, try local inst directory (development mode)
    if (!nzchar(template_path) || !file.exists(template_path)) {
      local_template <- file.path("inst", "templates", "insert_all_template.sql")
      if (file.exists(local_template)) {
        template_path <- local_template
      }
    }

    # Final check for default template
    if (!nzchar(template_path) || !file.exists(template_path)) {
      stop(
        "Default template not found. Please:\n",
        "1. Provide explicit `template_path`, or\n",
        "2. Ensure `inst/templates/insert_all_template.sql` exists in package, or\n",
        "3. Install package properly so templates are in correct location.\n",
        "Searched paths: templates/insert_all_template.sql, inst/templates/insert_all_template.sql, ./inst/templates/insert_all_template.sql"
      )
    }
  }

  # Validate provided or found template
  if (!file.exists(template_path)) {
    stop("Template file not found: ", template_path)
  }

  # Validate template content
  tryCatch(
    {
      template_content <- .read_file(template_path)
      .validate_template_content(template_content, template_path)
    },
    error = function(e) {
      stop("Template validation failed for '", template_path, "': ", e$message)
    }
  )
  stopifnot(is.numeric(chunk_size), chunk_size >= 1)

  # -- deps (import via NAMESPACE or suggest + requireNamespace) ---------------
  if (!requireNamespace("readxl", quietly = TRUE)) {
    stop("Package 'readxl' is required.")
  }
  if (!requireNamespace("whisker", quietly = TRUE)) {
    stop("Package 'whisker' is required.")
  }
  if (!requireNamespace("janitor", quietly = TRUE)) {
    stop("Package 'janitor' is required.")
  }

  # -- read data ---------------------------------------------------------------
  df <- readxl::read_excel(excel_path, sheet = sheet, guess_max = 10000)
  if (!is.data.frame(df) || nrow(df) == 0L) stop("Excel sheet had 0 data rows.")

  # Clean column names
  df <- janitor::clean_names(df)

  # Apply additional cleaning: uppercase and remove non-alphabetical characters except "_"
  clean_col_names <- function(names) {
    names %>%
      toupper() %>%
      gsub("[^A-Z0-9_]", "", .)
  }

  names(df) <- clean_col_names(names(df))
  col_order <- colnames(df)

  # heuristic: coerce date-like character columns to Date (using cleaned names)
  date_like <- grepl("(^DATE$|_DATE$|^DATUM$|_DATUM$|_DAY$|_DT$)", col_order)
  for (nm in col_order[date_like]) {
    if (is.character(df[[nm]])) {
      suppressWarnings({
        cand <- as.Date(df[[nm]])
        if (any(!is.na(cand))) df[[nm]] <- cand
      })
    }
  }

  # Convert POSIXct columns to Date if they contain only date components (no time)
  for (nm in col_order) {
    if (inherits(df[[nm]], c("POSIXct", "POSIXt"))) {
      # Check if all non-NA values have time component of 00:00:00
      non_na_vals <- df[[nm]][!is.na(df[[nm]])]
      if (length(non_na_vals) > 0) {
        time_components <- format(non_na_vals, "%H:%M:%S")
        if (all(time_components == "00:00:00")) {
          # Convert to Date since there's no actual time information
          df[[nm]] <- as.Date(df[[nm]])
        }
      }
    }
  }

  # -- prepare template and index flags ---------------------------------------
  tpl <- .read_file(template_path)
  create_index_flag <- !is.null(index_col) && nzchar(index_col)

  if (create_index_flag && is.null(index_name)) {
    clean <- function(z) toupper(gsub("[^A-Za-z0-9]+", "_", z))
    index_name <- paste0("IX_", clean(table_name), "_", clean(index_col))
  }

  col_list <- paste(col_order, collapse = ", ")

  # Analyze columns for CREATE TABLE statement
  columns_def <- .analyze_columns(df, col_order)

  n <- nrow(df)
  starts <- seq.int(1L, n, by = as.integer(chunk_size))

  # Generate header with DROP TABLE and CREATE TABLE (only once)
  header_data <- list(
    comment = if (is.null(comment)) {
      sprintf(
        "Generated on %s from %s (sheet: %s); total rows: %d",
        format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
        basename(excel_path), as.character(sheet), n
      )
    } else {
      comment
    },
    table = table_name,
    col_list = col_list,
    columns = columns_def,
    rows = list(), # Empty for header
    create_index = FALSE, # Don't create index in header
    index_name = "",
    index_col = ""
  )

  # Generate the header (DROP + CREATE TABLE) without any rows
  header_block <- whisker::whisker.render(tpl, header_data)

  # Remove the INSERT statements from header block (keep only up to "nologging;")
  header_lines <- strsplit(header_block, "\n")[[1]]
  table_end_idx <- which(grepl("nologging;", header_lines))
  if (length(table_end_idx) > 0) {
    header_block <- paste(header_lines[1:table_end_idx[1]], collapse = "\n")
  }

  # Generate INSERT blocks
  insert_blocks <- vector("list", length(starts))

  for (i in seq_along(starts)) {
    s <- starts[[i]]
    e <- min(s + chunk_size - 1L, n)

    # Process each row and create values string
    chunk_rows <- df[s:e, , drop = FALSE]
    rows_payload <- list()

    for (row_idx in seq_len(nrow(chunk_rows))) {
      row_data <- chunk_rows[row_idx, , drop = FALSE]

      # Create named vector for this row
      row_vec <- as.list(row_data[1, ])
      names(row_vec) <- col_order

      # Generate values string for this row
      values_str <- .row_values(row_vec, col_order)

      # Add to rows payload
      rows_payload[[row_idx]] <- list(
        table = table_name,
        col_list = col_list,
        values = values_str
      )
    }

    # Data for INSERT block only (no table creation)
    insert_data <- list(
      comment = "", # No comment for individual chunks
      table = table_name,
      col_list = col_list,
      columns = list(), # Empty for INSERT blocks
      rows = rows_payload,
      create_index = FALSE, # Don't create index in INSERT blocks
      index_name = "",
      index_col = ""
    )

    # Generate INSERT block and extract only INSERT statements
    full_block <- whisker::whisker.render(tpl, insert_data)

    # Extract only the INSERT statements (skip header and table creation)
    block_lines <- strsplit(full_block, "\n")[[1]]
    insert_start_idx <- which(grepl("^insert into", block_lines, ignore.case = TRUE))
    if (length(insert_start_idx) > 0) {
      insert_lines <- block_lines[insert_start_idx[1]:length(block_lines)]
      insert_blocks[[i]] <- paste(insert_lines, collapse = "\n")
    } else {
      insert_blocks[[i]] <- ""
    }
  }

  # Generate index block if needed
  index_block <- ""
  if (create_index_flag) {
    index_data <- list(
      comment = "",
      table = table_name,
      col_list = "",
      columns = list(),
      rows = list(),
      create_index = TRUE,
      index_name = index_name,
      index_col = index_col
    )
    index_block <- whisker::whisker.render(tpl, index_data)
    # Extract only the index creation part
    index_lines <- strsplit(index_block, "\n")[[1]]
    index_start_idx <- which(grepl("CREATE INDEX", index_lines, ignore.case = TRUE))
    if (length(index_start_idx) > 0) {
      index_block <- paste(index_lines[index_start_idx[1]:length(index_lines)], collapse = "\n")
    }
  }

  dir.create(dirname(out_sql), showWarnings = FALSE, recursive = TRUE)

  # Combine header, insert blocks, and index
  all_blocks <- c(header_block, insert_blocks)
  if (nzchar(index_block)) {
    all_blocks <- c(all_blocks, index_block)
  }

  # Clean up blocks to remove extra newlines and ensure proper formatting
  cleaned_blocks <- lapply(all_blocks, function(block) {
    # Remove trailing whitespace and ensure single newline at end
    block <- trimws(block, which = "right")
    if (!grepl("\n$", block)) {
      block <- paste0(block, "\n--")
    }
    return(block)
  })

  # Write blocks with proper separation
  cat(paste(cleaned_blocks, collapse = "\n"), file = out_sql, sep = "")
  invisible(out_sql)
}

#' Analyze data frame columns and generate Oracle column definitions
#' @param df Data frame to analyze
#' @param col_order Character vector of column names in desired order
#' @return List with column definitions for template
#' @keywords internal
.analyze_columns <- function(df, col_order) {
  columns <- list()

  for (i in seq_along(col_order)) {
    col_name <- col_order[i]
    col_data <- df[[col_name]]

    # Determine Oracle data type
    if (inherits(col_data, "Date")) {
      oracle_type <- "DATE"
    } else if (inherits(col_data, c("POSIXct", "POSIXt"))) {
      oracle_type <- "TIMESTAMP"
    } else if (is.numeric(col_data)) {
      # Check if all values are integers (allowing for NA)
      non_na_vals <- col_data[!is.na(col_data)]
      if (length(non_na_vals) > 0 && all(non_na_vals == as.integer(non_na_vals))) {
        oracle_type <- "NUMBER"
      } else {
        oracle_type <- "NUMBER"
      }
    } else if (is.logical(col_data)) {
      oracle_type <- "NUMBER" # Store as 1/0
    } else {
      # Character or other types - determine VARCHAR2 length
      char_data <- as.character(col_data)
      char_data <- char_data[!is.na(char_data)]

      if (length(char_data) == 0) {
        max_length <- 50 # Default for empty columns
      } else {
        max_length <- max(nchar(char_data), na.rm = TRUE)
        # Ensure minimum length and round up to reasonable increments
        max_length <- max(max_length, 10)
        if (max_length <= 50) {
          max_length <- ceiling(max_length / 10) * 10
        } else if (max_length <= 100) {
          max_length <- ceiling(max_length / 25) * 25
        } else if (max_length <= 500) {
          max_length <- ceiling(max_length / 50) * 50
        } else {
          max_length <- min(max_length * 1.2, 4000) # Oracle VARCHAR2 max
          max_length <- ceiling(max_length / 100) * 100
        }
      }
      oracle_type <- sprintf("VARCHAR2(%d)", as.integer(max_length))
    }

    columns[[i]] <- list(
      name = col_name,
      type = oracle_type,
      if_last = (i == length(col_order))
    )
  }

  return(columns)
}

#' @keywords internal
.as_oracle_literal <- function(x) {
  if (length(x) != 1L) {
    # vectorized by lapply in caller; keep singletons here
    stop(".as_oracle_literal expects length-1 values.")
  }
  if (is.na(x)) {
    return("NULL")
  }

  if (inherits(x, "Date")) {
    return(sprintf("DATE '%s'", format(x, "%Y-%m-%d")))
  }
  if (inherits(x, "POSIXct") || inherits(x, "POSIXt")) {
    ts <- format(x, "%Y-%m-%d %H:%M:%S")
    return(sprintf(
      "TO_TIMESTAMP('%s','YYYY-MM-DD HH24:MI:SS')", ts
    ))
  }
  if (is.numeric(x)) {
    if (is.nan(x) || is.infinite(x)) {
      return("NULL")
    }
    return(formatC(x, digits = 15, format = "fg"))
  }
  if (is.logical(x)) {
    return(ifelse(isTRUE(x), "1", "0"))
  }
  # character/fallback
  val <- gsub("'", "''", as.character(x), fixed = TRUE)
  sprintf("'%s'", val)
}

#' @keywords internal
.row_values <- function(named_vec, col_order) {
  vals <- vapply(col_order, function(nm) .as_oracle_literal(named_vec[[nm]]),
    FUN.VALUE = character(1L), USE.NAMES = FALSE
  )
  paste0("(", paste(vals, collapse = ", "), ")")
}

#' @keywords internal
.read_file <- function(path) {
  sz <- file.info(path)$size
  if (is.na(sz) || sz <= 0) stop("Template appears empty: ", path)
  content <- readChar(path, sz, useBytes = TRUE)
  # Normalize line endings to prevent extra empty lines in output
  content <- gsub("\r\n", "\n", content, fixed = TRUE)
  content <- gsub("\r", "\n", content, fixed = TRUE)
  return(content)
}

#' Validate template content for required Mustache variables
#' @param content Character scalar, the template content
#' @param path Character scalar, template file path (for error messages)
#' @keywords internal
.validate_template_content <- function(content, path) {
  if (is.null(content) || !is.character(content) || length(content) == 0) {
    stop("Template content is empty or invalid")
  }

  # Required Mustache variables for the template to work
  required_vars <- c(
    "table", # {{table}} - table name
    "col_list", # {{col_list}} - column list
    "columns", # {{#columns}} - column definitions for CREATE TABLE
    "rows", # {{#rows}} - row iteration
    "values" # {{values}} - within rows iteration
  )

  # Optional but commonly used variables
  optional_vars <- c(
    "comment", # {{comment}} - header comment
    "create_index", # {{#create_index}} - index creation block
    "index_name", # {{index_name}} - index name
    "index_col" # {{index_col}} - index column
  )

  missing_required <- c()

  # Check for required variables
  for (var in required_vars) {
    # Check for both {{var}} and {{#var}} patterns
    if (!grepl(paste0("\\{\\{#?", var, "\\}\\}"), content)) {
      missing_required <- c(missing_required, var)
    }
  }

  if (length(missing_required) > 0) {
    stop(
      "Template validation failed. Missing required Mustache variables: ",
      paste(paste0("{{", missing_required, "}}"), collapse = ", "),
      "\nTemplate must include these variables for proper SQL generation."
    )
  }

  # Check for proper row iteration structure (multiline-aware)
  has_rows_start <- grepl("\\{\\{#rows\\}\\}", content)
  has_values <- grepl("\\{\\{values\\}\\}", content)
  has_rows_end <- grepl("\\{\\{/rows\\}\\}", content)

  if (!has_rows_start || !has_values || !has_rows_end) {
    warning(
      "Template may have incorrect row iteration structure. ",
      "Expected pattern: {{#rows}} ... {{values}} ... {{/rows}}"
    )
  }

  # Provide helpful suggestions if optional variables are missing
  missing_optional <- c()
  for (var in optional_vars) {
    if (!grepl(paste0("\\{\\{#?", var, "\\}\\}"), content)) {
      missing_optional <- c(missing_optional, var)
    }
  }

  if (length(missing_optional) > 0) {
    message(
      "Template info: Optional variables not found: ",
      paste(paste0("{{", missing_optional, "}}"), collapse = ", "),
      "\nThis is OK, but these features won't be available."
    )
  }

  return(TRUE)
}
