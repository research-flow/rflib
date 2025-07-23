#' Create a SurveyQuestion object
#'
#' @param id Question identifier
#' @param tipus Type of the question (e.g., "likert_scale")
#' @param data Tibble with respondent_id and answer
#' @param label Optional question label (from df_labels)
#' @param color_scale Optional color scale for the question
#' @return A SurveyQuestion object (S3)
#' @export
survey_question <- function(id, tipus, data, label = NULL, color_scale = NULL) {
  structure(
    list(
      id = id,
      tipus = tipus,
      data = data,
      wrangled = tryCatch(survey_wrangle_dispatch(tipus, data), error = function(e) NULL),
      label = label,
      group = "Teljes minta", # TODO when we have groups, this will be dynamic
      color_scale = color_scale
    ),
    class = "SurveyQuestion"
  )
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

  if (rewrangle) {
    question$wrangled <- tryCatch(survey_wrangle_dispatch(tipus, question$data, question$label), error = function(e) NULL)
  }

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

  for (i in seq_len(nrow(def))) {
    qid <- as.character(def$kerdes_szam[i])
    tp <- def$tipus[i]

    if (!qid %in% names(survey_obj$questions)) {
      warning(paste("Question", qid, "not found in Survey object. Skipping."))
      next
    }

    survey_obj <- survey_add_type(survey_obj, question_id = qid, tipus = tp, rewrangle = rewrangle)

    if (replot) {
      question <- survey_obj$questions[[qid]]
      question$plot <- tryCatch(survey_plot_dispatch(tp, question$wrangled), error = function(e) NULL)
      survey_obj$questions[[qid]] <- question
    }
  }

  return(survey_obj)
}
