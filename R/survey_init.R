#' Initialize survey workflow as Survey object
#'
#' @param path Path to the Excel file
#' @param clean_text Whether to run text classification on open-text (default = TRUE)
#' @param save_output Whether to save intermediate outputs (default = FALSE)
#' @return A Survey object with metadata, labels, and question objects
#' @importFrom dplyr n_distinct filter pull
#' @importFrom stringr str_wrap
#' @importFrom rlang .data
#' @export
survey_init <- function(path, clean_text = TRUE, save_output = FALSE) {
  message("Loading answers and labels...")
  df_answers <- rflib::survey_load_answers(path) |> rflib::survey_prepare_answers()
  df_labels <- rflib::survey_load_labels(path) |> rflib::survey_prepare_label()
  df_title <- rflib::survey_load_title(path)

  # message("Pairing questions with labels (advanced)...")
  # df_complete_data <- left_join(df_labels, df_answers)

  message("Creating Survey object...")
  n_respondent <- dplyr::n_distinct(df_answers$respondent_id)
  obj <- rflib::survey(title = df_title, labels = df_labels, n_respondent = n_respondent)

  unique_questions <- unique(df_answers$kerdesszam)
  # First, add question-related values except 'tipus'
  for (qid in unique_questions) {
    q_data <- df_answers %>% dplyr::filter(.data$kerdesszam == qid)
    q_labels <- df_labels %>% dplyr::filter(.data$kerdesszam == qid)
    tipus <- NULL

    unique_vals <-
      c(
        q_labels %>%
          dplyr::pull(.data$valasz_szovege),
        q_labels %>%
          dplyr::pull(.data$oszlop_szovege)
      ) %>%
      unique() %>%
      sort()

    assigned_palette <-
      setNames(rflib::long_palette()[seq_along(unique_vals)], unique_vals)


    question_obj <- rflib::survey_question(id = qid, data = q_data, tipus = tipus, label = q_labels, color_scale = assigned_palette)
    obj <- rflib::survey_add_question(obj, question_obj)
  }

  if (save_output) {
    message("Saving paired data to RDS...")
    # saveRDS(df_complete_data, file = paste0(tools::file_path_sans_ext(basename(path)), "_joined.rds"))
  }

  return(obj)
}
