#' Create a tibble of original and cleaned names
#'
#' @param df_answers Character vector of original names
#' @return A tibble with columns 'name' and 'name_clean'
#' @export
survey_prepare_answers <- function(df_answers) {
    if (!"question" %in% names(df_answers)) {
        stop("The input data frame must contain a 'question' column.")
    }
    df_answers_clean_names <- df_answers %>%
        distinct(question) %>%
        dplyr::mutate(
            name_clean = janitor::make_clean_names(question),
            kerdes = stringr::str_extract(name_clean, "x[0-9]+_[a-z]+_|x[0-9]+_[0-9]+_[0-9]+|x[0-9]+_.$"),
            kerdes_szam = stringr::str_extract(kerdes, "x([0-9]+)", group = 1),
            kerdes_betu = stringr::str_extract(kerdes, "x[0-9]+_([a-z]+)|x[0-9]+_[0-9]+_([0-9]+)|x[0-9]+_(.)$", group = 1)
        ) %>%
        group_by(kerdes_szam) %>%
        mutate(
            kerdes_szam_szam_dense = dense_rank(kerdes_betu),
            kerdes_szam_szam_row = row_number(),
        ) %>%
        ungroup() %>%
        transmute(
            question,
            name_clean,
            kerdesbetu = case_when(
                is.na(kerdes_szam_szam_dense) ~ kerdes_szam_szam_row,
                TRUE ~ kerdes_szam_szam_dense
            ),
            kerdes = paste0(
                kerdes_szam,
                "_", kerdesbetu
            ),
            kerdesszam = kerdes_szam
        )

    df_answers %>%
        dplyr::left_join(df_answers_clean_names, by = c("question")) %>%
        transmute(
            respondent_id,
            kerdes,
            kerdesszam,
            kerdesbetu,
            question,
            name_clean,
            answer
        ) %>%
        drop_na(answer)
}

#' Prepare label table for advanced pairing
#'
#' @param df_labels Data frame of label definitions
#' @return A tibble with cleaned and extracted label info
#' @export
survey_prepare_label <- function(df_labels) {
    df_labels %>%
        dplyr::mutate(
            kerdes = stringr::str_c(valasz_szamjele),
            kerdes = stringr::str_replace_all(kerdes, "\\.", "_"),
            kerdesbetu = as.numeric(stringr::str_remove(kerdes, stringr::str_c(kerdesszam, "_")))
        )
}

#' Clean and pair survey column names with labels
#'
#' @param df_answers Data frame of survey answers (long format, with original column names)
#' @param df_labels Data frame of label definitions
#' @return A tibble with original and cleaned column names, extracted question/answer codes, and joined label info
#' @export
survey_pair_questions_labels <- function(df_answers, df_labels) {
    df_answers_clean_names <- survey_prepare_answers(df_answers)

    df_labels_clean <- survey_prepare_label(df_labels)

    left_join(
        df_labels_clean,
        df_answers_reduced,
        by = join_by(kerdes, kerdesszam, kerdesbetu)
    )
}
