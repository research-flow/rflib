#' Automated Survey Report Generator
#'
#' This script creates a Survey object, adds definitions, and renders the presentation
#' with dynamic YAML parameters
#' Generate Survey Presentation
#'
#' @param survey_folder Folder name containing survey files (e.g., "177_TAPADULT_250626")
#' @param title Custom title for the presentation (optional)
#' @param subtitle Custom subtitle (optional)
#' @param date Custom date (optional, defaults to today)
#' @param output_file Output file name (optional)
#' @param template_file Template Rmd file to use
#' @param reference_doc PowerPoint reference document
#' @param survey_to_render Survey object to render (optional, otherwise searches the survey_folder_raw.xlsx)
#' @return Path to generated presentation
#' @export
generate_survey_presentation <- function(
    survey_folder,
    title = "Research Flow prezentáció",
    subtitle = "Vizualizációk",
    date = NULL,
    output_file = NULL,
    template_file = "templates/survey_template.Rmd",
    reference_doc = NULL,
    survey_to_render = NULL) {
    # Set defaults
    if (is.null(date)) {
        date <- paste("Készült:", format(Sys.Date(), "%Y. %B %d."))
    }

    if (is.null(output_file)) {
        output_file <- paste0(title, ".pptx")
    }

    # Extract just the folder name for file construction
    folder_name <- basename(survey_folder)

    # Construct file paths
    raw_file <- file.path(survey_folder, paste0(folder_name, "_raw.xlsx"))
    seged_file <- file.path(survey_folder, paste0(folder_name, "_kerdes_seged.xlsx"))

    # Check if files exist
    if (!file.exists(raw_file)) {
        stop("Raw file not found: ", raw_file)
    }

    if (!file.exists(seged_file)) {
        stop("Definition file not found: ", seged_file)
    }

    # Check if reference document exists
    # if (!file.exists(reference_doc)) {
    #     stop("Reference document not found: ", reference_doc)
    # }

    # Convert to absolute path to avoid issues
    # reference_doc <- normalizePath(reference_doc, winslash = "/")


    message("Creating Survey object from: ", raw_file)
    message("Creating Survey object from: ", raw_file)

    if (is.null(survey_to_render)) {
        # Create Survey object
        Survey <- rflib::survey_init(raw_file)
        Survey <- rflib::survey_add_definition(Survey, seged_file, replot = TRUE)
    } else {
        Survey <- survey_to_render
    }

    # Use Survey title if no custom title provided
    if (is.null(title)) {
        title <- if (!is.null(Survey$title)) Survey$title else survey_folder
    }

    message("Survey created with ", length(Survey$question), " questions")
    message("Survey title: ", title)

    # Make Survey object available globally for the Rmd
    assign("Survey", Survey, envir = .GlobalEnv)

    # Check environment variables for Pandoc
    # Check Pandoc availability and environment variable
    pandoc_available <- rmarkdown::pandoc_available()
    rstudio_pandoc <- Sys.getenv("RSTUDIO_PANDOC")

    if (!pandoc_available || rstudio_pandoc == "") {
        warning(
            "Pandoc issues detected:\n",
            if (!pandoc_available) "- Pandoc is not available in RMarkdown\n" else "",
            if (rstudio_pandoc == "") "- RSTUDIO_PANDOC environment variable is not set\n" else "",
            "Please ensure Pandoc is installed and accessible.\n",
            "You may need to set RSTUDIO_PANDOC to your Pandoc installation directory:\n",
            "Example: Sys.setenv(RSTUDIO_PANDOC = 'C:/Program Files/Pandoc')"
        )
    } else {
        message("Using Pandoc version ", rmarkdown::pandoc_version(), " from: ", rstudio_pandoc)
    }

    # Debug information
    message("Current working directory: ", getwd())
    message("Template file: ", template_file)
    message("Template file exists: ", file.exists(template_file))
    message("Helper file exists: ", file.exists("R/direct_render_helpers.R"))
    message("Survey object exists: ", exists("Survey"))

    # Render the presentation with parameters
    message("Rendering presentation...")

    result_file <- rmarkdown::render(
        input = template_file,
        output_file = output_file,
        params = list(
            survey_title = title,
            survey_subtitle = subtitle,
            survey_date = date
        ),
        envir = globalenv(),
        knit_root_dir = getwd()
    )

    message("Presentation generated: ", result_file)
    return(result_file)
}

#' Generate Survey HTML Report
#'
#' @param survey_folder Folder name containing survey files (e.g., "177_TAPADULT_250626")
#' @param title Custom title for the report (optional)
#' @param subtitle Custom subtitle (optional)
#' @param date Custom date (optional, defaults to today)
#' @param output_file Output file name (optional)
#' @param template_file Template Rmd file to use
#' @return Path to generated HTML report
#' @export
generate_survey_html_report <- function(
    survey_folder,
    title = "Research Flow HTML jelentés",
    subtitle = "Interaktív vizualizációk",
    date = NULL,
    output_file = NULL,
    template_file = "templates/html_report_template.Rmd") {
    # Set defaults
    if (is.null(date)) {
        date <- paste("Készült:", format(Sys.Date(), "%Y. %B %d."))
    }

    if (is.null(output_file)) {
        output_file <- paste0(basename(survey_folder), "_report.html")
    }

    # Extract just the folder name for file construction
    folder_name <- basename(survey_folder)

    # Construct file paths
    raw_file <- file.path(survey_folder, paste0(folder_name, "_raw.xlsx"))
    seged_file <- file.path(survey_folder, paste0(folder_name, "_kerdes_seged.xlsx"))

    # Check if files exist
    if (!file.exists(raw_file)) {
        stop("Raw file not found: ", raw_file)
    }

    if (!file.exists(seged_file)) {
        stop("Definition file not found: ", seged_file)
    }

    message("Creating Survey object from: ", raw_file)

    # Create Survey object
    Survey <- rflib::survey_init(raw_file)
    Survey <- rflib::survey_add_definition(Survey, seged_file, replot = TRUE)

    # Use Survey title if no custom title provided
    if (is.null(title)) {
        title <- if (!is.null(Survey$title)) Survey$title else survey_folder
    }

    message("Survey created with ", length(Survey$question), " questions")
    message("Survey title: ", title)

    # Make Survey object available globally for the Rmd
    assign("Survey", Survey, envir = .GlobalEnv)

    pandoc_available <- rmarkdown::pandoc_available()
    rstudio_pandoc <- Sys.getenv("RSTUDIO_PANDOC")

    if (!pandoc_available || rstudio_pandoc == "") {
        warning(
            "Pandoc issues detected:\n",
            if (!pandoc_available) "- Pandoc is not available in RMarkdown\n" else "",
            if (rstudio_pandoc == "") "- RSTUDIO_PANDOC environment variable is not set\n" else "",
            "Please ensure Pandoc is installed and accessible.\n",
            "You may need to set RSTUDIO_PANDOC to your Pandoc installation directory:\n",
            "Example: Sys.setenv(RSTUDIO_PANDOC = 'C:/Program Files/Pandoc')"
        )
    } else {
        message("Using Pandoc version ", rmarkdown::pandoc_version(), " from: ", rstudio_pandoc)
    }
    # Debug information
    message("Current working directory: ", getwd())
    message("Template file: ", template_file)
    message("Template file exists: ", file.exists(template_file))
    message("Helper file exists: ", file.exists("R/direct_render_helpers.R"))
    message("Survey object exists: ", exists("Survey"))

    # Render the HTML report with parameters
    message("Rendering HTML report...")

    result_file <- rmarkdown::render(
        input = template_file,
        output_file = output_file,
        params = list(
            survey_title = title,
            survey_subtitle = subtitle,
            survey_date = date
        ),
        envir = globalenv(),
        knit_root_dir = getwd()
    )

    message("HTML report generated: ", result_file)
    return(result_file)
}

#' Batch generate presentations for multiple surveys
#'
#' @param survey_folders Vector of survey folder names
#' @param titles Vector of survey titles
#' @param base_subtitle Base subtitle to use
#' @return Vector of generated file paths
#' @export
batch_generate_presentations <- function(survey_folders, titles = NULL, base_subtitle = "Vizualizációk") {
    # Validate inputs
    if (!is.character(survey_folders) || length(survey_folders) == 0) {
        stop("survey_folders must be a non-empty character vector")
    }

    # Check if titles are provided and validate length
    if (!is.null(titles)) {
        if (!is.character(titles)) {
            stop("titles must be a character vector")
        }
        if (length(titles) != length(survey_folders)) {
            stop(
                "titles vector must have the same length as survey_folders vector. ",
                "Expected: ", length(survey_folders), ", Got: ", length(titles)
            )
        }
    }

    generated_files <- character()

    for (i in seq_along(survey_folders)) {
        folder <- survey_folders[i]
        current_title <- if (!is.null(titles)) titles[i] else NULL

        message("\n=== Processing ", folder, " ===")
        if (!is.null(current_title)) {
            message("Using title: ", current_title)
        }
        tryCatch(
            {
                result_file <- generate_survey_presentation(
                    survey_folder = folder,
                    title = current_title,
                    subtitle = base_subtitle
                )
                generated_files <- c(generated_files, result_file)
                message("✓ Successfully generated: ", basename(result_file))
            },
            error = function(e) {
                message("✗ Error processing ", folder, ": ", e$message)
            }
        )
    }

    if (!is.null(titles)) {
        # Show summary of what was generated
        summary_df <- data.frame(
            Folder = survey_folders,
            Title = titles,
            Generated = basename(generated_files),
            stringsAsFactors = FALSE
        )
        message("\nGeneration Summary:")
        print(summary_df)
    }

    message("\n=== BATCH COMPLETE ===")
    message("Generated ", length(generated_files), " presentations")

    return(generated_files)
}
