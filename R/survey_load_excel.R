#' Load title string from the Title sheet (cell A2) in the survey Excel
#'
#' @param path Path to the Excel file
#' @return A character string with the title from cell A2
#' @export
survey_load_title <- function(path) {
  sheets <- readxl::excel_sheets(path)
  if (!any(tolower(sheets) == tolower("Információ"))) {
    stop("The Excel file must contain a sheet named 'Információ' (case-insensitive).")
  }
  title_sheet <- sheets[which(tolower(sheets) == tolower("Információ"))[1]]
  # Read only cell A2
  title_val <- suppressMessages(
    readxl::read_excel(path, sheet = title_sheet, range = "A2", col_names = FALSE)
  )
  as.character(title_val[[1, 1]])
}

#' Load survey answer data from the first sheet and pivot to long format
#'
#' @param path Path to the Excel file
#' @return A tibble in long format with columns respondent_id, question, and answer
#' @export
#' @importFrom dplyr arrange filter select all_of
#' @importFrom tidyr pivot_longer
#' @importFrom readxl excel_sheets read_excel
#' @importFrom magrittr %>%
#' @importFrom rlang .data
survey_load_answers <- function(path) {
  df <- readxl::read_excel(path, sheet = 1)

  # Find RFAZON, Időbélyeg, and Lezarva columns case-insensitively
  colnames_lower <- tolower(names(df))
  rfazon_idx <- which(colnames_lower == tolower("RFAZON"))
  idobelyeg_idx <- which(colnames_lower == tolower("Időbélyeg"))
  # Match both 'Lezarva' and 'Lezárva' (with accented á)
  lezarva_idx <- which(colnames_lower == tolower("Lezarva") | colnames_lower == tolower("Lezárva"))

  if (length(rfazon_idx) == 0) {
    stop("RFAZON column is required in the data (case-insensitive match).")
  }
  rfazon_col <- names(df)[rfazon_idx]


  # If Időbélyeg exists, arrange, filter, and remove it
  if (length(idobelyeg_idx) > 0) {
    idobelyeg_col <- names(df)[idobelyeg_idx]
    df <- df %>%
      dplyr::arrange(.data[[idobelyeg_col]]) %>%
      dplyr::filter(!is.na(.data[[idobelyeg_col]])) %>%
      dplyr::select(-dplyr::all_of(idobelyeg_col))
    # After deselecting, need to re-find Lezarva column index
    colnames_lower <- tolower(names(df))
    lezarva_idx <- which(colnames_lower == tolower("Lezarva") | colnames_lower == tolower("Lezárva"))
  }

  # If Lezarva exists, filter for Lezarva == 1, print filtered row count, and remove column
  if (length(lezarva_idx) > 0) {
    lezarva_col <- names(df)[lezarva_idx]
    n_before <- nrow(df)
    df <- df %>% dplyr::filter(.data[[lezarva_col]] == 1)
    n_after <- nrow(df)
    message(sprintf("Filtered %d rows for Lezarva == 1 (from %d to %d)", n_before - n_after, n_before, n_after))
    df <- df %>% dplyr::select(-dplyr::all_of(lezarva_col))
  }

  # Pivot longer using RFAZON as unique id
  df_long <- df %>%
    dplyr::rename(respondent_id = dplyr::all_of(rfazon_col)) %>%
    tidyr::pivot_longer(
      cols = -"respondent_id",
      names_to = "question",
      values_to = "answer"
    )

  return(df_long)
}

#' Load label sheet from survey Excel
#'
#' @param path Path to the Excel file
#' @return A tibble with variable names, values, and labels
#' @export
survey_load_labels <- function(path) {
  sheets <- readxl::excel_sheets(path)
  if (!any(tolower(sheets) == tolower("Label"))) {
    stop("The Excel file must contain a sheet named 'Label' (case-insensitive).")
  }
  label_sheet <- sheets[which(tolower(sheets) == tolower("Label"))[1]]
  readxl::read_excel(path, sheet = label_sheet) %>%
    janitor::clean_names() %>%
    mutate_at(vars("valasz_szovege"), ~ stringr::str_replace_all(.x, "[\\u200B-]", " ")) %>%
    {
      if ("valasz_szamjele" %in% names(.)) {
        tidyr::drop_na(., valasz_szamjele)
      } else {
        .
      }
    }
}

#' Pair question metadata from answer and label sheets
#'
#' @param df_answers Data frame of responses (long format)
#' @param df_labels Data frame of label definitions
#' @return A tibble linking question columns to value labels
#' @export
survey_pair_questions_labels <- function(df_answers, df_labels) {
  vars <- unique(df_answers$question)
  df_labels_filtered <- df_labels[df_labels$varname %in% vars, ]
  df_labels_filtered
}
