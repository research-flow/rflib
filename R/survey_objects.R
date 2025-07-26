#' Create a SurveyQuestion object
#'
#' @param id Question identifier
#' @param tipus Type of the question (e.g., "likert_scale")
#' @param data Tibble with respondent_id and answer
#' @param label Optional question label (from df_labels)
#' @return A SurveyQuestion object (S3)
#' @export
survey_question <- function(id, tipus, data, label = NULL, color_scale = NULL) {
  question <- structure(
    list(
      id = id,
      tipus = tipus,
      data = data,
      wrangled = tryCatch(survey_wrangle_dispatch(tipus, data), error = function(e) NULL),
      label = label,
      group = "Teljes minta",
      color_scale = color_scale,
      likert_labeller = NULL, # For likert_scale questions, this will hold the labels
      ggplot_fn = NULL, # Function to create ggplot
      echarts_fn = NULL # Function to create echarts
    ),
    class = "SurveyQuestion"
  )

  # Create function factories for lazy plot creation if tipus is provided
  if (!is.null(tipus)) {
    # Store a reference to create functions that will use the current question state
    question$ggplot_fn <- "ggplot"
    question$echarts_fn <- "echarts"
  }

  return(question)
}

#' Create a Survey object
#'
#' @param title Survey title (from title sheet)
#' @param labels Label dataframe from label sheet
#' @return A Survey object containing metadata and question list
#' @export
survey <- function(title, labels) {
  structure(
    list(
      title = title,
      labels = labels,
      questions = list()
    ),
    class = "Survey"
  )
}

#' Add question to Survey object
#'
#' @param survey_obj A Survey object
#' @param question_obj A SurveyQuestion object
#' @return Updated Survey object
#' @export
survey_add_question <- function(survey_obj, question_obj) {
  survey_obj$questions[[question_obj$id]] <- question_obj
  survey_obj
}

#' Add or update the tipus (question type) for a SurveyQuestion in a Survey
#'
#' @param survey_obj A Survey object
#' @param question_id The question identifier (e.g., "1", "Q5", etc.)
#' @param tipus A string representing the question type (e.g., "likert_scale")
#' @param rewrangle Logical, whether to rerun the wrangling function after assigning type
#'
#' @return The updated Survey object
#' @export
survey_add_type <- function(survey_obj, question_id, tipus, rewrangle = TRUE) {
  if (!inherits(survey_obj, "Survey")) {
    stop("Input must be a Survey object.")
  }
  if (!question_id %in% names(survey_obj$questions)) {
    stop(paste("Question", question_id, "not found in Survey."))
  }

  question <- survey_obj$questions[[question_id]]
  question$tipus <- tipus
  dimensions <- get_question_dimensions(tipus)

  question$width <- dimensions$width
  question$height <- dimensions$height

  if (rewrangle) {
    question$wrangled <- tryCatch(survey_wrangle_dispatch(tipus, question$data, question$label), error = function(e) NULL)
  }

  # Create function factories for lazy plot creation
  question$ggplot_fn <- "ggplot"
  question$echarts_fn <- "echarts"

  survey_obj$questions[[question_id]] <- question
  return(survey_obj)
}


#' Add definition Excel to Survey object and assign tipus for each question
#'
#' @param survey_obj A Survey object
#' @param definition_path Path to Excel containing columns: kerdes_szam, tipus
#' @param rewrangle Logical, rerun wrangling immediately (default: TRUE)
#' @param replot Logical, rerun plot creation if enabled (default: FALSE)
#'
#' @return Updated Survey object
#' @export
survey_add_definition <- function(survey_obj, definition_path, rewrangle = TRUE, replot = FALSE) {
  if (!inherits(survey_obj, "Survey")) {
    stop("survey_obj must be of class Survey.")
  }

  def <- readxl::read_excel(definition_path) %>%
    dplyr::rename_with(janitor::make_clean_names) %>%
    dplyr::select(kerdes_szam, tipus)

  # Check for Likert sheet
  if ("Likert" %in% readxl::excel_sheets(definition_path)) {
    likert_labels <- readxl::read_excel(definition_path, sheet = "Likert") %>%
      dplyr::rename_with(janitor::make_clean_names) %>%
      dplyr::select(question_id, first_label, last_label) %>%
      dplyr::group_by(question_id) %>%
      dplyr::filter(dplyr::row_number() == 1) %>%
      dplyr::ungroup()

    duplicate_questions <- readxl::read_excel(definition_path, sheet = "Likert") %>%
      dplyr::rename_with(janitor::make_clean_names) %>%
      dplyr::count(question_id) %>%
      dplyr::filter(n > 1)

    if (nrow(duplicate_questions) > 0) {
      warning(
        "The following questions have multiple rows in the 'Likert' sheet. Only the first row will be used:",
        paste(duplicate_questions$question_id, collapse = ", ")
      )
    }

    message("'Likert' sheet found. Processing Likert labels.")
  } else {
    message("'Likert' sheet not found. Proceeding with numeric values.")
    likert_labels <- NULL
  }

  # Check for AnswerGroups sheet
  if ("AnswerGroups" %in% readxl::excel_sheets(definition_path)) {
    answer_groups <- readxl::read_excel(definition_path, sheet = "AnswerGroups") %>%
      dplyr::rename_with(janitor::make_clean_names)

    for (group_col in colnames(answer_groups)) {
      group_questions <- answer_groups[[group_col]] %>%
        na.omit() %>%
        unique()
      if (length(group_questions) > 0) {
        # Collect unique values from valasz_szovege and oszlop_szovege across the group
        group_values <- purrr::map(group_questions, function(qid) {
          if (qid %in% names(survey_obj$questions)) {
            question <- survey_obj$questions[[qid]]
            dplyr::bind_rows(
              question$label %>% dplyr::select(values = valasz_szovege),
              question$label %>% dplyr::select(values = oszlop_szovege)
            ) %>%
              tidyr::drop_na() %>%
              dplyr::distinct()
          } else {
            NULL
          }
        }) %>%
          dplyr::bind_rows() %>%
          dplyr::distinct()

        # Assign color scale to all questions in the group
        color_scale <- setNames(rflib::long_palette()[seq_len(nrow(group_values))], group_values$values)

        for (qid in group_questions) {
          if (qid %in% names(survey_obj$questions)) {
            survey_obj$questions[[qid]]$color_scale <- color_scale
          }
          message(paste("Color scales assigned for group:", qid))
        }
      }
    }

    message("'AnswerGroups' sheet found. Color scales aligned for grouped questions.")
  } else {
    message("'AnswerGroups' sheet not found. Using standard color scales.")
  }

  for (i in seq_len(nrow(def))) {
    qid <- as.character(def$kerdes_szam[i])
    tp <- def$tipus[i]

    if (!qid %in% names(survey_obj$questions)) {
      warning(paste("Question", qid, "not found in Survey object. Skipping."))
      next
    }

    base_color_scale <- survey_obj$questions[[qid]]$color_scale

    # Extend color scale for str_wrap(20), str_wrap(30), and str_wrap(50)
    extended_color_scale <- c(
      base_color_scale,
      setNames(base_color_scale, stringr::str_wrap(names(base_color_scale), 20)),
      setNames(base_color_scale, stringr::str_wrap(names(base_color_scale), 30)),
      setNames(base_color_scale, stringr::str_wrap(names(base_color_scale), 50))
    )

    survey_obj$questions[[qid]]$color_scale <- extended_color_scale

    survey_obj <- survey_add_type(survey_obj, question_id = qid, tipus = tp, rewrangle = rewrangle)

    if (!is.null(likert_labels)) {
      if (stringr::str_detect(tp, "likert")) {
        question_labels <- likert_labels %>%
          dplyr::filter(question_id == qid)

        if (nrow(question_labels) == 0) {
          message(paste("Likert question", qid, "has no labels in the 'Likert' sheet. Proceeding without labels."))
        } else {
          question <- survey_obj$questions[[qid]]
          question$likert_labeller <- question_labels %>%
            dplyr::select(first_label, last_label)
          survey_obj$questions[[qid]] <- question
        }
      } else {
        if (qid %in% likert_labels$question_id) {
          message(paste("Non-Likert question", qid, "has labels in the 'Likert' sheet. Discarding these labels."))
        }
      }
    }

    if (replot) {
      question <- survey_obj$questions[[qid]]
      # Update function factories for lazy plot creation
      question$ggplot_fn <- "ggplot"
      question$echarts_fn <- "echarts"
      survey_obj$questions[[qid]] <- question
    }
  }

  return(survey_obj)
}


#' Get default dimensions for question types
#'
#' @param tipus A string representing the question type
#' @return A list with width and height values
#' @export
get_question_dimensions <- function(tipus) {
  dimensions <- switch(tipus,
    "col_eloszlas" = list(width = 10, height = 4),
    "col_eloszlas_longitud" = list(width = 10, height = 4),
    "col_eloszlas_multiple" = list(width = 10, height = 4),
    "col_eloszlas_multiple_longitud" = list(width = 10, height = 4),
    "col_eloszlas_multiple_orig" = list(width = 10, height = 4),
    "col_eloszlas_multiple_table" = list(width = 10, height = 4),
    "col_eloszlas_multiple_table_switch" = list(width = 10, height = 4),
    "col_eloszlas_total_multiple" = list(width = 10, height = 4),
    "diszkret_eloszlas_multiple" = list(width = 13, height = 6),
    "divider" = list(width = 10, height = 4),
    "divider_longitud" = list(width = 10, height = 4),
    "eloszlas" = list(width = 10, height = 4),
    "hoterkep" = list(width = 13, height = 7),
    "iranyito_eloszlas" = list(width = 12, height = 7),
    "likert_scale" = list(width = 13, height = 7),
    "likert_scale_longitud" = list(width = 18, height = 10),
    "likert_scale_new" = list(width = 10, height = 9),
    "likert_scale_ref" = list(width = 13, height = 7),
    "likert_scale_rev" = list(width = 13, height = 7),
    "likert_scale_table" = list(width = 13, height = 7),
    "regio_eloszlas" = list(width = 12, height = 7),
    "resz_egesz_combined" = list(width = 17, height = 7),
    "resz_egesz_multiple" = list(width = 17, height = 8),
    "resz_egesz_multiple_longitud" = list(width = 10, height = 4),
    "resz_egesz_total" = list(width = 17, height = 7),
    "resz_egesz_total_longitud" = list(width = 10, height = 4),
    "szam_col_egyeb" = list(width = 17, height = 7),
    "szoveg_buborek" = list(width = 10, height = 4),
    "szoveg_buborek_multiple" = list(width = 10, height = 4),
    "szoveg_col" = list(width = 17, height = 7),
    "szoveg_col_count" = list(width = 10, height = 4),
    "szoveg_col_egyeb" = list(width = 17, height = 7),
    "szoveg_col_egyeb_new" = list(width = 17, height = 7),
    "szoveg_col_multiple" = list(width = 17, height = 7),
    "t_proba" = list(width = 17, height = 8),
    "t_proba_table" = list(width = 17, height = 8),
    "table" = list(width = 17, height = 8),
    "table_atlag" = list(width = 17, height = 8),
    "table_egyeb" = list(width = 17, height = 8),
    "table_oszlop" = list(width = 17, height = 8),
    "table_rev" = list(width = 17, height = 8),
    "table_sor" = list(width = 17, height = 8),
    "terulet_eloszlas" = list(width = 12, height = 7),
    "terulet_eloszlas_longitud" = list(width = 12, height = 7),
    "time_series" = list(width = 10, height = 4),
    "year_eloszlas" = list(width = 10, height = 4),
    "year_eloszlas_longitud" = list(width = 10, height = 4),
    "year_eloszlas_unscale" = list(width = 10, height = 4),
    "year_eloszlas_unscale_longitud" = list(width = 10, height = 4),
    "z_proba" = list(width = 10, height = 4),
    # Default dimensions for unknown types
    list(width = 10, height = 4)
  )
  return(dimensions)
}

#' Create ggplot for SurveyQuestion object
#'
#' @param x A SurveyQuestion object
#' @param ... Additional arguments (unused)
#' @return A ggplot object
#' @export
plot.SurveyQuestion <- function(x, type = "ggplot", ...) {
  if (type == "ggplot") {
    if (is.null(x$ggplot_fn) || is.null(x$tipus)) {
      stop("No ggplot function available for this question. Make sure the question type is properly set.")
    }
    tryCatch(survey_plot_dispatch("ggplot", x), error = function(e) {
      stop(paste("Error creating ggplot:", e$message))
    })
  } else if (type == "echarts") {
    if (is.null(x$echarts_fn) || is.null(x$tipus)) {
      stop("No echarts function available for this question. Make sure the question type is properly set.")
    }
    tryCatch(survey_plot_dispatch("echarts", x), error = function(e) {
      stop(paste("Error creating echarts:", e$message))
    })
  } else {
    stop("type must be either 'ggplot' or 'echarts'")
  }
}

#' Create ggplot for SurveyQuestion object
#'
#' @param question A SurveyQuestion object
#' @param ... Additional arguments (unused)
#' @return A ggplot object
#' @export
get_ggplot <- function(question, ...) {
  UseMethod("get_ggplot")
}

#' @export
get_ggplot.SurveyQuestion <- function(question, ...) {
  if (is.null(question$ggplot_fn) || is.null(question$tipus)) {
    stop("No ggplot function available for this question. Make sure the question type is properly set.")
  }
  tryCatch(survey_plot_dispatch("ggplot", question), error = function(e) {
    stop(paste("Error creating ggplot:", e$message))
  })
}

#' Create echarts for SurveyQuestion object
#'
#' @param question A SurveyQuestion object
#' @param ... Additional arguments (unused)
#' @return An echarts object
#' @export
get_echarts <- function(question, ...) {
  UseMethod("get_echarts")
}

#' @export
get_echarts.SurveyQuestion <- function(question, ...) {
  if (is.null(question$echarts_fn) || is.null(question$tipus)) {
    stop("No echarts function available for this question. Make sure the question type is properly set.")
  }
  tryCatch(survey_plot_dispatch("echarts", question), error = function(e) {
    stop(paste("Error creating echarts:", e$message))
  })
}
