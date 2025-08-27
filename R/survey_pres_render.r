#' Direct Rendering Functions (No knit_child needed)
#'
#' These functions generate markdown content directly without knit_child

#' Render a question directly to markdown (text only, no chunks)
#'
#' @param question Question object from Survey
#' @param question_index Index of the question for unique chunk names
#' @return Character string with markdown content (headers and notes only)
#' @export
render_question_direct <- function(question, question_index) {
    # Generate the markdown content (just headers and notes)
    markdown_content <- stringr::str_c(
        "## ", question$label$kerdes_szoveg[[1]], "\n\n",
        "::: notes\n", question$group, "\n:::\n\n"
    )

    return(markdown_content)
}

#' Render multiple questions from Survey (text only)
#'
#' @param Survey Survey object
#' @param question_indices Which questions to render (default: all)
#' @return Character vector with markdown content for each question
#' @export
render_survey_questions <- function(Survey, question_indices = NULL) {
    if (is.null(question_indices)) {
        question_indices <- seq_along(Survey$question)
    }

    out_to_plot <- character(length(question_indices))

    for (i in seq_along(question_indices)) {
        idx <- question_indices[i]
        question <- Survey$question[[idx]]

        # Generate markdown content (headers only)
        out_to_plot[i] <- render_question_direct(question, idx)
    }

    return(out_to_plot)
}

#' Generate plot chunks for all questions
#'
#' @param Survey Survey object
#' @param question_indices Which questions to render
#' @param fig_width Figure width
#' @param fig_height Figure height
#' @return List of plot objects
#' @export
get_question_plots <- function(Survey, question_indices = NULL, fig_width = 8, fig_height = 4) {
    if (is.null(question_indices)) {
        question_indices <- seq_along(Survey$question)
    }

    plots <- list()

    for (i in seq_along(question_indices)) {
        idx <- question_indices[i]
        plots[[i]] <- Survey$question[[idx]]$ggplot
    }

    return(plots)
}

#' Render all survey slides with individual plot dimensions
#'
#' @param Survey Survey object
#' @param question_indices Which questions to render (default: all questions)
#' @param default_fig_width Default figure width if question doesn't specify
#' @param default_fig_height Default figure height if question doesn't specify
#' @param include_title Whether to include the survey title as first slide (default: TRUE)
#' @export
render_all_slides <- function(Survey, question_indices = NULL, default_fig_width = 17, default_fig_height = 10, include_title = TRUE) {
    # Default to all questions if none specified
    if (is.null(question_indices)) {
        question_indices <- seq_along(Survey$question)
    }

    # Track omitted slides
    omitted_slides <- character()
    successfully_rendered <- 0
    out_to_plot <- character(length(question_indices))

    # Process each question using knit_child
    for (i in seq_along(question_indices)) {
        idx <- question_indices[i]
        question <- Survey$question[[idx]]

        # Message current progress
        message("Rendering slide ", i, " of ", length(question_indices), " (Question index: ", idx, ")")

        # Try to render this question with error handling
        slide_result <- tryCatch(
            {
                # Get dimensions from question or use defaults
                fig_width <- ifelse(!is.null(question$width), question$width, default_fig_width)
                fig_height <- ifelse(!is.null(question$height), question$height, default_fig_height)

                # Use knit_child with the plot template
                # Pass the question object and figure dimensions to the child environment
                out_to_plot[i] <- knitr::knit_child(
                    "templates/plot_template.Rmd",
                    envir = list(
                        question = question,
                        fig_width = fig_width,
                        fig_height = fig_height
                    ),
                    quiet = TRUE
                )

                # If we get here, the slide was successful
                "success"
            },
            error = function(e) {
                # Log the error and mark slide as omitted
                warning("Error rendering slide ", i, " (Question index: ", idx, "): ", e$message)
                return(paste0("error: ", e$message))
            }
        )

        # Check if slide was successful or failed
        if (startsWith(slide_result, "error:")) {
            omitted_slides <- c(omitted_slides, paste0("Slide ", i, " (Question ", idx, "): ", gsub("error: ", "", slide_result)))
            out_to_plot[i] <- "" # Set empty string for failed slides
        } else {
            successfully_rendered <- successfully_rendered + 1
        }
    }

    # Summary message
    message("\n=== RENDERING COMPLETE ===")
    message("Successfully rendered: ", successfully_rendered, " slides")
    message("Total attempted: ", length(question_indices), " slides")

    if (length(omitted_slides) > 0) {
        message("\nOMITTED SLIDES:")
        for (omitted in omitted_slides) {
            message("  - ", omitted)
        }
    } else {
        message("All slides rendered successfully!")
    }

    # Return the combined output
    return(paste(out_to_plot, collapse = "\n\n"))
}

#' Render a plot with specific dimensions using permanent files
#'
#' @param id question index
#' @param width Figure width in inches
#' @param height Figure height in inches
#' @export
render_plot_with_dimensions <- function(id, width, height) {
    # Instead of saving files, create R chunks that render plots directly
    # This lets knitr handle the plot rendering with proper dimensions

    # Extract question index from label (assuming label format like "plot_1", "plot_2", etc.)
    question_index <- id

    # Create an R chunk that calls get_ggplot directly
    # Use separate cat() calls to ensure proper formatting
    paste0(
        "```{r echo=FALSE, warning=FALSE, message=FALSE, fig.width=", width, ", fig.height=", height, "}\n",
        "rflib::get_ggplot(Survey$question[[", question_index, "]])\n",
        "```\n\n",
        sep = ""
    )
}
