#' Generate a source file that loads R scripts in alphabetical order
#'
#' This function generates a script file (by default named '00_INDITO.R') that will
#' source all R files from a specified directory in alphabetical order. The generated
#' file sets up database connections, logging, and executes all R scripts in the specified directory.
#'
#' @param source_dir Character scalar. Directory containing R files to be sourced.
#' @param output_file Optional character scalar. Path where the generated file should be written.
#'        If NULL (default), creates "00_INDITO.R" in the source directory.
#' @param working_directory Character scalar. The working directory to set in the generated script.
#'        Defaults to the current working directory.
#' @param schema Character scalar. Database schema name for test environment.
#'        Defaults to "RFLOW".
#' @param test_dsn Character scalar. Database Source Name for test environment.
#'        Defaults to "RFLOW - Oracle".
#' @param header_comment Character scalar. A comment to include at the top of the file.
#'        If NULL, a default comment is generated.
#' @param template_path Optional character scalar. Path to a custom template file.
#'        If NULL, uses the default template bundled with the package.
#'
#' @return Invisibly returns the path to the generated file. If native pipe operators
#'        are found and not replaced, returns a character vector of file paths containing them.
#'
#' @export
generate_source_file <- function(
    source_dir,
    output_file = NULL,
    working_directory = getwd(),
    schema = "RFLOW",
    test_dsn = "RFLOW - Oracle",
    header_comment = NULL,
    template_path = NULL) {
    if (!requireNamespace("cli", quietly = TRUE)) {
        stop("Package 'cli' is required.")
    }

    cli::cli_h1("Starting source file generation")

    # Input validation
    cli::cli_alert_info("Validating source directory")
    if (!dir.exists(source_dir)) {
        cli::cli_alert_danger("Source directory does not exist: {.path {source_dir}}")
        stop()
    }

    # Normalize path and set output file
    source_dir <- normalizePath(source_dir, winslash = "/", mustWork = TRUE)
    if (is.null(output_file)) {
        output_file <- file.path(dirname(source_dir), "00_INDITO.R")
    }
    cli::cli_alert_success("Using source directory: {.path {source_dir}}")
    cli::cli_alert_info("Output will be generated at: {.path {output_file}}") # Find template
    if (is.null(template_path)) {
        # Get package name safely
        pkg_name <- tryCatch(utils::packageName(), error = function(e) "rflib")
        if (is.null(pkg_name)) pkg_name <- "rflib"

        # Try to find default template in package
        template_path <- system.file("templates", "r_source_template.R",
            package = pkg_name
        )

        # If not found in installed package, try inst directory (for development)
        if (!nzchar(template_path) || !file.exists(template_path)) {
            inst_template <- file.path("inst", "templates", "r_source_template.R")
            if (file.exists(inst_template)) {
                template_path <- inst_template
            }
        }

        if (!file.exists(template_path)) {
            stop(
                "Template file not found. Please:\n",
                "1. Provide explicit template_path, or\n",
                "2. Ensure inst/templates/r_source_template.R exists in package"
            )
        }
    }

    # Read template
    template_content <- readChar(template_path, file.info(template_path)$size)

    cli::cli_h2("Scanning files")
    cli::cli_alert_info("Looking for R files")
    # List R files in directory
    r_files <- list.files(
        path = source_dir,
        pattern = "\\.R$",
        full.names = FALSE,
        recursive = TRUE
    )

    # Remove the output file from the list if it exists in source_dir
    r_files <- r_files[r_files != basename(output_file)]

    # Sort alphabetically
    r_files <- sort(r_files)

    cli::cli_alert_success("Found {.val {length(r_files)}} R files to process") # Prepare data for template
    data <- list(
        header_comment = if (is.null(header_comment)) {
            sprintf("Auto-generated source file for R scripts")
        } else {
            header_comment
        },
        generation_date = format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
        working_directory = working_directory,
        schema = schema,
        test_dsn = test_dsn,
        source_folder = source_dir,
        r_files = r_files
    )

    # Render template
    if (!requireNamespace("whisker", quietly = TRUE)) {
        stop("Package 'whisker' is required.")
    }

    output <- whisker::whisker.render(template_content, data)

    # Ensure output directory exists
    dir.create(dirname(source_dir), showWarnings = FALSE, recursive = TRUE)

    cli::cli_h2("Analyzing code style")
    cli::cli_alert_info("Checking for native pipe operators")
    # Check for native pipe operators in all R files
    files_with_native_pipe <- character(0)
    pipe_locations <- list()
    total_files <- length(r_files)

    # Setup progress bar
    cli::cli_progress_bar("Analyzing files", total = total_files)

    for (i in seq_along(r_files)) {
        file <- r_files[i]
        cli::cli_progress_update()

        file_path <- file.path(source_dir, file)
        file_content <- readLines(file_path, warn = FALSE) # Find lines containing native pipe operator
        pipe_lines <- grep("\\|>", file_content, value = FALSE)

        if (length(pipe_lines) > 0) {
            files_with_native_pipe <- c(files_with_native_pipe, file_path)
            pipe_locations[[file_path]] <- pipe_lines
        }
    }

    # Clean up rendered output to remove extra newlines
    clean_output <- function(text) {
        # Split into lines
        lines <- strsplit(text, "\n")[[1]]
        # Remove empty lines at start and end
        lines <- trimws(lines, which = "right")
        # Collapse multiple empty lines into single empty line
        prev_empty <- FALSE
        cleaned <- character(0)
        for (line in lines) {
            is_empty <- nchar(trimws(line)) == 0
            if (!is_empty || !prev_empty) {
                cleaned <- c(cleaned, line)
            }
            prev_empty <- is_empty
        }
        # Join back together
        paste(cleaned, collapse = "\n")
    }

    # If we found any native pipes, show the locations and ask for confirmation
    if (length(files_with_native_pipe) > 0) {
        cli::cli_h3("Native pipe operators found")
        cli::cli_bullets(c(
            "!" = "Found {.val {length(files_with_native_pipe)}} files with native pipe operators:"
        ))

        for (file in names(pipe_locations)) {
            cli::cli_bullets(c(
                "*" = "{.path {file}}:",
                " " = "Lines: {.val {paste(pipe_locations[[file]], collapse = ', ')}}"
            ))
        }

        # Ask for confirmation
        cli::cli_alert_warning("Do you want to replace all {.code |>} operators with {.code %>%}?")
        cli::cli_text("{.strong Replace operators?} {.emph [y/N]} ", appendLF = FALSE)
        answer <- tolower(trimws(readline()))

        # Echo the answer for better UX
        cli::cli_alert_info("You chose: {.val {if(answer == 'y') 'yes' else 'no'}}")

        if (identical(answer, "y")) {
            cli::cli_h3("Replacing operators")
            cli::cli_progress_bar("Updating files", total = length(files_with_native_pipe))

            for (file in files_with_native_pipe) {
                cli::cli_progress_update()
                file_content <- readLines(file, warn = FALSE)
                file_content <- gsub("\\|>", "%>%", file_content)
                writeLines(file_content, file)
            }
            cli::cli_progress_done()
            cli::cli_alert_success("Replacement complete")
            files_with_native_pipe <- character(0) # Clear the list since we replaced all pipes
        } else {
            cli::cli_alert_info("Skipping replacement as per user request")
        }
    }

    cli::cli_h2("Generating output")
    # Clean and write the output file
    cleaned_output <- clean_output(output)
    writeLines(cleaned_output, output_file)
    cli::cli_alert_success("Generated file: {.path {normalizePath(output_file)}}")

    cli::cli_h1("Source file generation complete")

    if (length(files_with_native_pipe) > 0) {
        # Return list of files with pipes if they weren't replaced
        invisible(files_with_native_pipe)
    } else {
        # Return the output file path if no pipes found or all were replaced
        invisible(normalizePath(output_file))
    }
}
