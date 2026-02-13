#' Dispatch plot function based on plot type and question type
#'
#' @param plottype A string: "ggplot" or "echarts"
#' @param question A SurveyQuestion object
#' @param language Language code for chart labels ("hu" or "en", default "hu")
#' @return A plot object (ggplot or echarts4r)
#' @export
survey_plot_dispatch <- function(plottype, question, language = "hu") {
  type <- question$tipus
  if (!is.null(question$language)) {
    language <- question$language
  }
  if (plottype == "ggplot") {
    switch(type,
      "resz_egesz_total" = survey_ggplot_resz_egesz_total(question, language),
      "resz_egesz_multiple" = survey_ggplot_resz_egesz_multiple(question, language),
      "likert_scale" = survey_ggplot_likert_scale(question, language),
      "naptar" = survey_ggplot_naptar(question, language),
      "col_with_number" = survey_ggplot_col_with_number(question, language),
      "col_with_szoveg" = survey_ggplot_col_with_szoveg(question, language),
      "col_eloszlas_total" = survey_ggplot_col_eloszlas_multiple(question, language),
      "col_eloszlas_multiple" = survey_ggplot_col_eloszlas_multiple(question, language),
      "year_eloszlas_unscale" = survey_ggplot_year_eloszlas_unscale(question, language),
      "regio_eloszlas" = survey_ggplot_regio_eloszlas(question, language),
      "iranyito_eloszlas" = survey_ggplot_regio_eloszlas(question, language),
      "szoveg_col_egyeb" = survey_ggplot_szoveg_col_egyeb(question, language),
      "year_eloszlas" = survey_ggplot_year_eloszlas(question, language),
      "table" = survey_ggplot_table(question, language),
      "szoveg_buborek" = survey_ggplot_szoveg_buborek(question, language),
      "table_atlag" = survey_ggplot_table_atlag(question, language),
      "likert_scale_rev" = survey_ggplot_likert_scale_rev(question, language),
      "szoveg_col_egyeb_new" = survey_ggplot_szoveg_col_egyeb_new(question, language),
      "szoveg_buborek_multiple" = survey_ggplot_szoveg_buborek_multiple(question, language),
      "hoterkep" = survey_ggplot_hoterkep(question, language),
      "terulet_eloszlas" = survey_ggplot_terulet_eloszlas(question, language),
      "likert_scale_table" = survey_ggplot_likert_scale_table(question, language),
      "likert_scale_ref" = survey_ggplot_likert_scale_ref(question, language),
      "table_sor" = survey_ggplot_table_sor(question, language),
      "table_rev" = survey_ggplot_table_rev(question, language),
      "szam_col_egyeb" = survey_ggplot_szam_col_egyeb(question, language),
      "table_oszlop" = survey_ggplot_table_oszlop(question, language),
      "diszkret_eloszlas" = survey_ggplot_diszkret_eloszlas(question, language),
      "table_egyeb" = survey_ggplot_table_egyeb(question, language),
      "combobox" = survey_ggplot_combobox(question, language),
      stop(paste("Unknown ggplot question type:", type))
    )
  } else if (plottype == "echarts") {
    switch(type,
      "resz_egesz_total" = survey_echarts_resz_egesz_total(question, language),
      "resz_egesz_multiple" = survey_echarts_resz_egesz_multiple(question, language),
      "likert_scale" = survey_echarts_likert_scale(question, language),
      # "naptar" = survey_echarts_naptar(question, language),
      # "col_with_number" = survey_echarts_col_with_number(question, language),
      # "col_with_szoveg" = survey_echarts_col_with_szoveg(question, language),
      "col_eloszlas_total" = survey_echarts_col_eloszlas_multiple(question, language),
      "col_eloszlas_multiple" = survey_echarts_col_eloszlas_multiple(question, language),
      "year_eloszlas_unscale" = survey_echarts_year_eloszlas_unscale(question, language),
      "regio_eloszlas" = survey_echarts_regio_eloszlas(question, language),
      "iranyito_eloszlas" = survey_echarts_regio_eloszlas(question, language),
      "szoveg_col_egyeb" = survey_echarts_szoveg_col_egyeb(question, language),
      "year_eloszlas" = survey_echarts_year_eloszlas(question, language),
      "table" = survey_echarts_table(question, language),
      "szoveg_buborek" = survey_echarts_szoveg_buborek(question, language),
      "table_atlag" = survey_echarts_table_atlag(question, language),
      "likert_scale_rev" = survey_echarts_likert_scale_rev(question, language),
      "szoveg_col_egyeb_new" = survey_echarts_szoveg_col_egyeb_new(question, language),
      "szoveg_buborek_multiple" = survey_echarts_szoveg_buborek_multiple(question, language),
      "hoterkep" = survey_echarts_hoterkep(question, language),
      "terulet_eloszlas" = survey_echarts_terulet_eloszlas(question, language),
      "likert_scale_table" = survey_echarts_likert_scale_table(question, language),
      "likert_scale_ref" = survey_echarts_likert_scale_ref(question, language),
      "table_sor" = survey_echarts_table_sor(question, language),
      "table_rev" = survey_echarts_table_rev(question, language),
      "szam_col_egyeb" = survey_echarts_szam_col_egyeb(question, language),
      "table_oszlop" = survey_echarts_table_oszlop(question, language),
      "diszkret_eloszlas" = survey_echarts_diszkret_eloszlas(question, language),
      "table_egyeb" = survey_echarts_table_egyeb(question, language),
      # "combobox" = survey_echarts_combobox(question, language),
      stop(paste("Unknown echarts question type:", type))
    )
  } else {
    stop(paste("Unknown plot type:", plottype))
  }
}

#' Dispatch wrangling function based on question type
#'
#' @param tipus A string defining the question type
#' @param data A dataframe with the question's data
#' @param labels A dataframe with the question's labels
#' @return A wrangled dataframe suitable for plotting or analysis
#' @export
survey_wrangle_dispatch <- function(tipus, data, labels) {
  switch(tipus,
    "resz_egesz_total" = survey_wrangle_resz_egesz_total(data, labels),
    "resz_egesz_multiple" = survey_wrangle_resz_egesz_multiple(data, labels),
    "likert_scale" = survey_wrangle_likert_scale(data, labels),
    "naptar" = survey_wrangle_naptar(data, labels),
    "col_with_number" = survey_wrangle_col_with_number(data, labels),
    "col_with_szoveg" = survey_wrangle_col_with_szoveg(data, labels),
    "col_eloszlas_total" = survey_wrangle_col_eloszlas_multiple(data, labels),
    "col_eloszlas_multiple" = survey_wrangle_col_eloszlas_multiple(data, labels),
    "year_eloszlas_unscale" = survey_wrangle_year_eloszlas(data, labels),
    "regio_eloszlas" = survey_wrangle_regio_eloszlas(data, labels),
    "iranyito_eloszlas" = survey_wrangle_iranyito_eloszlas(data, labels),
    "szoveg_col_egyeb" = survey_wrangle_szoveg_col_egyeb(data, labels),
    "year_eloszlas" = survey_wrangle_year_eloszlas(data, labels),
    "table" = survey_wrangle_table(data, labels),
    "szoveg_buborek" = survey_wrangle_szoveg_buborek(data, labels),
    "table_atlag" = survey_wrangle_table_atlag(data, labels),
    "likert_scale_rev" = survey_wrangle_likert_scale_rev(data, labels),
    "szoveg_col_egyeb_new" = survey_wrangle_szoveg_col_egyeb_new(data, labels),
    "szoveg_buborek_multiple" = survey_wrangle_szoveg_buborek_multiple(data, labels),
    "hoterkep" = survey_wrangle_hoterkep(data, labels),
    "terulet_eloszlas" = survey_wrangle_terulet_eloszlas(data, labels),
    "likert_scale_table" = survey_wrangle_likert_scale_table(data, labels),
    "likert_scale_ref" = survey_wrangle_likert_scale_ref(data, labels),
    "table_sor" = survey_wrangle_table_sor(data, labels),
    "table_rev" = survey_wrangle_table_rev(data, labels),
    "szam_col_egyeb" = survey_wrangle_szam_col_egyeb(data, labels),
    "table_oszlop" = survey_wrangle_table_oszlop(data, labels),
    "diszkret_eloszlas" = survey_wrangle_diszkret_eloszlas(data, labels),
    "table_egyeb" = survey_wrangle_table_egyeb(data, labels),
    "combobox" = survey_wrangle_combobox(data, labels),
    stop(paste("Unknown question type:", tipus))
  )
}



#' Wrangle total part-whole question
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with one row per respondent and numeric total

survey_wrangle_resz_egesz_total <- function(df, labels) {
  # Check if answer can be converted to numeric
  if (!all(suppressWarnings(!is.na(as.numeric(df$answer))))) {
    stop("Some answers cannot be converted to numeric in survey_wrangle_resz_egesz_total.")
  }
  df %>%
    dplyr::mutate(answer = as.numeric(answer)) %>%
    dplyr::group_by(kerdes) %>%
    dplyr::mutate(mean = mean(answer, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(respondent_id) %>%
    dplyr::mutate(mean_perc = mean / sum(mean, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::right_join(
      labels
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    dplyr::mutate(
      valasz_szovege = stringr::str_wrap(valasz_szovege, 30),
      valasz_szovege = forcats::fct_inorder(valasz_szovege)
    )
}

#' Wrangle multiple part-whole question
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with proportions for each selected part

survey_wrangle_resz_egesz_multiple <- function(df, labels) {
  if (!all(suppressWarnings(!is.na(as.numeric(df$answer))))) {
    stop("Some answers cannot be converted to numeric in survey_wrangle_resz_egesz_multiple.")
  }
  df %>%
    dplyr::mutate(answer = as.numeric(answer)) %>%
    dplyr::group_by(kerdes) %>%
    dplyr::mutate(mean = mean(answer, na.rm = TRUE), n = n_distinct(respondent_id)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(respondent_id) %>%
    dplyr::mutate(mean_perc = mean / sum(mean, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::right_join(
      labels
      # by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    dplyr::mutate(
      valasz_szovege = stringr::str_wrap(valasz_szovege, 30),
      valasz_szovege = forcats::fct_inorder(valasz_szovege)
    )
}


#' Wrangle Likert scale question
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with summarized proportions per answer option

survey_wrangle_likert_scale <- function(df, labels) {
  if (!all(suppressWarnings(!is.na(as.numeric(df$answer))))) {
    stop("Some answers cannot be converted to numeric in survey_wrangle_likert_scale.")
  }
  df %>%
    dplyr::group_by(kerdes, kerdesszam, kerdesbetu) %>%
    dplyr::group_modify(~ {
      df <- .x %>% dplyr::mutate(answer = as.numeric(answer))
      # Expand possible values
      if (!is.na(labels$tol[1]) && (labels$tol[1] %in% c(0, -1))) {
        vals <- seq(1, max(labels$ig, na.rm = TRUE))
      } else if (labels$tol[1] == -2) {
        vals <- seq(0, max(labels$ig, na.rm = TRUE))
      } else {
        vals <- seq(min(labels$tol, na.rm = TRUE), max(labels$ig, na.rm = TRUE))
      }
      # Count occurrences
      counts <- df %>%
        dplyr::count(answer, name = "count") %>%
        tidyr::complete(answer = vals, fill = list(count = 0)) %>%
        dplyr::filter(answer %in% vals)
      # Calculate percentages
      counts <- counts %>%
        dplyr::mutate(
          n = sum(count),
          percentage = count / sum(count) * 100
        )
      # Calculate mean
      mean_val <- weighted.mean(counts$answer, counts$count)

      counts %>%
        dplyr::mutate(
          mean = mean_val,
          alpha = counts$count / max(counts$count) * 0.8
        )
    }) %>%
    dplyr::ungroup() %>%
    dplyr::right_join(
      labels
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    dplyr::arrange(dplyr::desc(mean)) %>%
    replace_na(list(valasz_szovege = "")) %>%
    dplyr::mutate(
      valasz_szovege = stringr::str_wrap(valasz_szovege, 50),
      valasz_szovege = forcats::fct_inorder(valasz_szovege)
    )
}


#' Wrangle column distribution question
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with frequency per answer

survey_wrangle_col_eloszlas_total <- function(df, labels) {
  # No numeric conversion needed, but check answer is character
  if (!is.character(df$answer)) {
    stop("Answers must be character in survey_wrangle_col_eloszlas_total.")
  }
  df %>%
    dplyr::filter(answer == "on") %>%
    dplyr::count(kerdes, answer, name = "count") %>%
    dplyr::mutate(percentage = count / sum(count)) %>%
    dplyr::left_join(labels, by = "kerdes") %>%
    dplyr::arrange(dplyr::desc(kerdes)) %>%
    dplyr::mutate(
      valasz_szovege = stringr::str_wrap(valasz_szovege, 30),
      valasz_szovege = forcats::fct_inorder(valasz_szovege)
    )
}

#' Wrangle column distribution question (multiple)
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with frequency per answer
survey_wrangle_col_eloszlas_multiple <- function(df, labels) {
  if (!is.character(df$answer)) {
    stop("Answers must be character in survey_wrangle_col_eloszlas_multiple.")
  }
  df %>%
    dplyr::filter(answer == "on") %>%
    dplyr::mutate(resp_count = dplyr::n_distinct(respondent_id)) |>
    dplyr::group_by(kerdes) %>%
    dplyr::reframe(
      count = dplyr::n(),
      percentage = count / resp_count
    ) %>%
    dplyr::ungroup() %>%
    unique() %>%
    dplyr::right_join(labels, by = "kerdes") %>%
    tidyr::replace_na(list(count = 0, percentage = 0))
}

#' Wrangle column distribution question (multiple)
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with frequency per answer
survey_wrangle_naptar <- function(df, labels) {
  df %>%
    dplyr::mutate(
      n_total = dplyr::n_distinct(respondent_id),
      date = lubridate::floor_date(lubridate::ymd(answer), unit = "months")
    ) |>
    tidyr::drop_na(date) |>
    dplyr::count(kerdes, date, n_total) |>
    dplyr::right_join(
      labels
    ) |>
    dplyr::mutate(
      year = as.character(lubridate::year(date)),
      month = lubridate::month(date, label = T, locale = "LC_US"),
      min_year = min(lubridate::year(date)),
      max_year = max(lubridate::year(date))
    ) |>
    (\(x)
    tidyr::crossing(
      year = as.character(min(lubridate::year(x$date)):max(lubridate::year(x$date))),
      month = lubridate::month(1:12, label = TRUE, locale = "LC_US")
    ) |>
      dplyr::left_join(x)
    )()
}
#' Wrangle column distribution question (multiple)
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with frequency per answer
survey_wrangle_col_with_number <- function(df, labels) {
  full_join(
    df %>%
      dplyr::filter(answer != "on") |>
      dplyr::transmute(kerdes, answer_num = as.numeric(answer)) %>%
      dplyr::left_join(labels, by = "kerdes"),
    df %>%
      dplyr::filter(answer == "on") %>%
      dplyr::mutate(resp_count = dplyr::n_distinct(respondent_id)) |>
      dplyr::group_by(kerdes) %>%
      dplyr::reframe(
        count = dplyr::n(),
        percentage = count / resp_count
      ) %>%
      dplyr::ungroup() %>%
      unique() %>%
      dplyr::right_join(labels, by = "kerdes") |>
      tidyr::replace_na(list(count = 0, percentage = 0))
  )
}
#' Wrangle column distribution question (multiple)
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with frequency per answer
survey_wrangle_col_with_szoveg <- function(df, labels) {
  full_join(
    df %>%
      dplyr::filter(answer != "on") %>%
      tidyr::separate_longer_delim(cols = "answer", delim = ";") |>
      dplyr::filter(!(answer %in% c("NA", "NULL", "", "0"))) %>%
      dplyr::mutate(answer = stringr::str_to_title(stringr::str_squish(answer))) %>%
      dplyr::count(kerdes, answer, name = "count") %>%
      dplyr::left_join(
        labels
        # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
      ) %>%
      dplyr::mutate(
        oszlop_szovege = as.character(oszlop_szovege),
        valasz_szovege = as.character(valasz_szovege)
      ) %>%
      tidyr::replace_na(
        list(
          valasz_szovege = "",
          oszlop_szovege = ""
        )
      ) %>%
      dplyr::arrange(count) %>%
      dplyr::mutate(
        total_szoveg = valasz_szovege,
        total_szoveg = stringr::str_wrap(total_szoveg, 30),
        total_szoveg = forcats::fct_inorder(total_szoveg)
      ),
    df %>%
      dplyr::filter(answer == "on") %>%
      dplyr::mutate(resp_count = dplyr::n_distinct(respondent_id)) |>
      dplyr::group_by(kerdes) %>%
      dplyr::reframe(
        resp_count,
        count_num = dplyr::n(),
        percentage = count_num / resp_count
      ) %>%
      dplyr::ungroup() %>%
      unique() %>%
      dplyr::right_join(labels, by = "kerdes") |>
      tidyr::replace_na(list(count_num = 0, percentage = 0))
  )
}

#' Wrangle year distribution
#'
#' @param df A tibble with columns respondent_id and answer
#' @param labels A tibble with question labels
#' @return A tibble with numeric answers joined to labels

survey_wrangle_year_eloszlas <- function(df, labels) {
  if (!all(suppressWarnings(!is.na(as.numeric(stringr::str_replace_all(df$answer, "\\,", "\\.")))))) {
    stop("Some answers cannot be converted to numeric in survey_wrangle_year_eloszlas.")
  }
  df %>%
    dplyr::mutate(answer = as.numeric(stringr::str_replace_all(answer, "\\,", "\\."))) %>%
    dplyr::left_join(labels, by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu"))
}

#' Wrangle table question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return A tibble with summary statistics for table questions

survey_wrangle_table <- function(df, labels) {
  df |>
    dplyr::group_by(kerdes) %>%
    dplyr::mutate(n = sum(!is.na(answer))) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(orvos_db = dplyr::n_distinct(respondent_id)) %>%
    dplyr::select(-respondent_id, -answer) %>%
    unique() %>%
    dplyr::right_join(
      labels
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    tidyr::replace_na(list(n = 0)) |>
    dplyr::mutate(orvos_db = max(orvos_db, na.rm = TRUE)) %>%
    dplyr::mutate(perc = n / orvos_db) |>
    dplyr::arrange(kerdesbetu) |>
    # dplyr::group_by(oszlop_szovege) |>
    # dplyr::filter(sum(n) > 0) |>
    # dplyr::ungroup() |>
    dplyr::mutate(
      oszlop_szovege = stringr::str_wrap(oszlop_szovege, 50),
      oszlop_szovege = forcats::fct_inorder(oszlop_szovege),
      valasz_szovege = stringr::str_wrap(valasz_szovege, 30),
      valasz_szovege = forcats::fct_inorder(valasz_szovege),
    )
}

#' Wrangle text bubble multiple question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return A tibble with processed text bubble multiple answers

survey_wrangle_szoveg_buborek <- function(df, labels) {
  oszlop_multiple <-
    (length(unique(na.omit(labels$oszlop_szovege))) > 1)
  valasz_multiple <-
    (length(unique(na.omit(labels$valasz_szovege))) > 1)

  df %>%
    dplyr::mutate(n_total = dplyr::n_distinct(respondent_id)) %>%
    dplyr::filter(answer != "on") %>%
    tidyr::separate_longer_delim(cols = "answer", delim = ";") |>
    dplyr::filter(!(answer %in% c("NA", "NULL", "", "0", "."))) %>%
    dplyr::filter(!str_detect(answer, "^[^A-Za-z0-9]$")) %>%
    dplyr::mutate(answer = stringr::str_to_title(stringr::str_squish(answer))) %>%
    dplyr::count(kerdesszam, answer, n_total, name = "count") %>%
    dplyr::right_join(
      distinct(labels, kerdesszam, kerdes_szoveg)
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    dplyr::mutate(
      valasz_szovege = "", oszlop_szovege = ""
    ) %>%
    dplyr::arrange(count) %>%
    dplyr::mutate(
      total_szoveg =
        dplyr::case_when(
          oszlop_multiple & valasz_multiple ~
            stringr::str_c(
              valasz_szovege, " ", oszlop_szovege
            ),
          oszlop_multiple & !valasz_multiple ~
            oszlop_szovege,
          !oszlop_multiple & valasz_multiple ~
            valasz_szovege,
          TRUE ~ stringr::str_c(
            valasz_szovege, " ", oszlop_szovege
          )
        ),
      total_szoveg = stringr::str_wrap(total_szoveg, 30),
      total_szoveg = forcats::fct_inorder(total_szoveg)
    )
  # filter(count > 1)
}


#' Wrangle text bubble multiple question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return A tibble with processed text bubble multiple answers

survey_wrangle_szoveg_buborek_multiple <- function(df, labels) {
  oszlop_multiple <-
    (length(unique(na.omit(labels$oszlop_szovege))) > 1)
  valasz_multiple <-
    (length(unique(na.omit(labels$valasz_szovege))) > 1)

  df %>%
    dplyr::filter(answer != "on") %>%
    tidyr::separate_longer_delim(cols = "answer", delim = ";") |>
    dplyr::filter(!(answer %in% c("NA", "NULL", "", "0"))) %>%
    dplyr::mutate(answer = stringr::str_to_title(stringr::str_squish(answer))) %>%
    dplyr::count(kerdes, answer, name = "count") %>%
    dplyr::right_join(
      labels
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    dplyr::mutate(
      oszlop_szovege = as.character(oszlop_szovege),
      valasz_szovege = as.character(valasz_szovege)
    ) %>%
    tidyr::replace_na(
      list(
        valasz_szovege = "",
        oszlop_szovege = ""
      )
    ) %>%
    dplyr::arrange(count) %>%
    dplyr::mutate(
      total_szoveg =
        dplyr::case_when(
          oszlop_multiple & valasz_multiple ~
            stringr::str_c(
              valasz_szovege, " ", oszlop_szovege
            ),
          oszlop_multiple & !valasz_multiple ~
            oszlop_szovege,
          !oszlop_multiple & valasz_multiple ~
            valasz_szovege,
          TRUE ~ stringr::str_c(
            valasz_szovege, " ", oszlop_szovege
          )
        ),
      total_szoveg = stringr::str_wrap(total_szoveg, 30),
      total_szoveg = forcats::fct_inorder(total_szoveg)
    )
  # filter(count > 1)
}




#' Wrangle region distribution question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_regio_eloszlas <- function(df, labels) {
  result <- df %>%
    dplyr::filter(answer == "on") %>%
    dplyr::mutate(resp_count = dplyr::n_distinct(respondent_id)) |>
    dplyr::group_by(kerdes) %>%
    dplyr::reframe(
      count = dplyr::n(),
      percentage = count / resp_count
    ) %>%
    dplyr::ungroup() %>%
    unique() %>%
    dplyr::left_join(labels, by = "kerdes") |>
    dplyr::mutate(
      # Clean geographic names: trim, squish, title case, remove special chars
      cleaned_answer = valasz_szovege %>%
        stringr::str_trim() %>%
        stringr::str_squish(),
      cleaned_answer = case_when(
        stringr::str_detect(cleaned_answer, "songrád") ~ "Csongrád",
        stringr::str_detect(cleaned_answer, "őváros") ~ "Budapest",
        TRUE ~ cleaned_answer
      )
    )

  szotar <- teruleti_szotar |>
    dplyr::select(-telepules_nev) |>
    dplyr::mutate_all(as.character) |>
    dplyr::mutate(regio = regio_nev) |>
    tidyr::pivot_longer(-regio_nev) |>
    dplyr::distinct()

  result |>
    dplyr::left_join(
      szotar,
      by = c("cleaned_answer" = "value")
    ) |>
    dplyr::group_by(regio_nev) |>
    summarise(
      count = sum(count, na.rm = TRUE),
      percentage = sum(percentage, na.rm = TRUE),
      .groups = "drop"
    )
}
#' Wrangle region distribution question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_iranyito_eloszlas <- function(df, labels) {
  result <- df %>%
    dplyr::transmute(
      kerdes,
      resp_count = dplyr::n_distinct(respondent_id),
      respondent_id,
      name = "iranyitoszam",
      value = answer,
      value_num = as.numeric(value)
    ) %>%
    tidyr::drop_na(value_num)

  szotar <- teruleti_szotar |>
    dplyr::select(-telepules_nev) |>
    dplyr::mutate_all(as.character) |>
    dplyr::mutate(regio = regio_nev) |>
    tidyr::pivot_longer(-regio_nev) |>
    dplyr::distinct()

  result |>
    dplyr::left_join(
      szotar,
      by = c("name", "value")
    ) |>
    dplyr::group_by(regio_nev) |>
    dplyr::summarise(
      count = dplyr::n_distinct(respondent_id, na.rm = TRUE),
      percentage = count / max(resp_count, na.rm = T),
      .groups = "drop"
    )
}
#' Wrangle other text column question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_szoveg_col_egyeb <- function(df, labels) {
  stop("Not implemented")
}

#' Wrangle table average question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_table_atlag <- function(df, labels) {
  df |>
    dplyr::group_by(kerdes) %>%
    mutate(mean = mean(as.numeric(answer), na.rm = T)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(orvos_db = dplyr::n_distinct(respondent_id)) %>%
    dplyr::select(-respondent_id, -answer) %>%
    unique() %>%
    dplyr::right_join(
      labels
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    tidyr::replace_na(list(mean = 0)) |>
    dplyr::mutate(orvos_db = max(orvos_db, na.rm = TRUE)) %>%
    dplyr::arrange(kerdesbetu) |>
    # dplyr::group_by(oszlop_szovege) |>
    # dplyr::filter(sum(n) > 0) |>
    # dplyr::ungroup() |>
    dplyr::mutate(
      oszlop_szovege = stringr::str_wrap(oszlop_szovege, 50),
      oszlop_szovege = forcats::fct_inorder(oszlop_szovege),
      valasz_szovege = stringr::str_wrap(valasz_szovege, 30),
      valasz_szovege = forcats::fct_inorder(valasz_szovege),
    )
}
#' Wrangle reversed Likert scale question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_likert_scale_rev <- function(df, labels) {
  if (!all(suppressWarnings(!is.na(as.numeric(df$answer))))) {
    stop("Some answers cannot be converted to numeric in survey_wrangle_likert_scale.")
  }
  df %>%
    dplyr::group_by(kerdes, kerdesszam, kerdesbetu) %>%
    dplyr::group_modify(~ {
      df <- .x %>% dplyr::mutate(answer = as.numeric(answer))
      # Expand possible values
      if (!is.na(labels$tol[1]) && labels$tol[1] <= 0) {
        vals <- seq(labels$tol[1] + 1, max(labels$ig, na.rm = TRUE))
      } else {
        vals <- seq(min(labels$tol, na.rm = TRUE), max(labels$ig, na.rm = TRUE))
      }
      # Count occurrences
      counts <- df %>%
        dplyr::count(answer, name = "count") %>%
        tidyr::complete(answer = vals, fill = list(count = 0)) %>%
        dplyr::filter(answer %in% vals)
      # Calculate percentages
      counts <- counts %>%
        dplyr::mutate(
          n = sum(count),
          percentage = count / sum(count) * 100
        )
      # Calculate mean
      mean_val <- weighted.mean(counts$answer, counts$count)

      counts %>%
        dplyr::mutate(
          mean = mean_val,
          alpha = counts$count / max(counts$count) * 0.8
        )
    }) %>%
    dplyr::ungroup() %>%
    dplyr::right_join(
      labels
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    dplyr::arrange(mean) %>%
    replace_na(list(valasz_szovege = "")) %>%
    dplyr::mutate(
      valasz_szovege = stringr::str_wrap(valasz_szovege, 50),
      valasz_szovege = forcats::fct_inorder(valasz_szovege)
    )
}
#' Wrangle new other text column question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_szoveg_col_egyeb_new <- function(df, labels) {
  stop("Not implemented")
}

#' Wrangle heatmap question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_hoterkep <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle area distribution question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_terulet_eloszlas <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle Likert scale table question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_likert_scale_table <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle Likert scale reference question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_likert_scale_ref <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle table row question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_table_sor <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle table reversed question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return A tibble with summary statistics for table questions

survey_wrangle_table_rev <- function(df, labels) {
  df |>
    dplyr::group_by(kerdes) %>%
    dplyr::mutate(n = sum(!is.na(answer))) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(orvos_db = dplyr::n_distinct(respondent_id)) %>%
    dplyr::select(-respondent_id, -answer) %>%
    unique() %>%
    dplyr::right_join(
      labels
      # , by = dplyr::join_by("kerdes", "kerdesszam", "kerdesbetu")
    ) %>%
    tidyr::replace_na(list(n = 0)) |>
    dplyr::mutate(orvos_db = max(orvos_db, na.rm = TRUE)) %>%
    dplyr::mutate(perc = n / orvos_db) |>
    dplyr::arrange(kerdesbetu) |>
    # dplyr::group_by(oszlop_szovege) |>
    # dplyr::filter(sum(n) > 0) |>
    # dplyr::ungroup() |>
    dplyr::mutate(
      oszlop_szovege = stringr::str_wrap(oszlop_szovege, 30),
      oszlop_szovege = forcats::fct_inorder(oszlop_szovege),
      valasz_szovege = stringr::str_wrap(valasz_szovege, 50),
      valasz_szovege = forcats::fct_inorder(valasz_szovege),
    )
}
#' Wrangle other numeric column question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_szam_col_egyeb <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle table column question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_table_oszlop <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle combobox question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_combobox <- function(df, labels) {
  df %>%
    dplyr::mutate(
      orvos_db = n_distinct(respondent_id)
    ) %>%
    dplyr::count(kerdes, answer, orvos_db) %>%
    dplyr::right_join(labels, by = join_by("kerdes", "answer" == "combobox_value")) %>%
    tidyr::replace_na(list(n = 0)) %>%
    dplyr::mutate(orvos_db = max(orvos_db, na.rm = TRUE)) %>%
    dplyr::mutate(perc = n / orvos_db) %>%
    dplyr::filter(valasz_tipusa == "Combobox") %>%
    tidyr::drop_na(combobox_szoveg) %>%
    dplyr::arrange(kerdes, answer) %>%
    dplyr::mutate(
      combobox_szoveg = stringr::str_wrap(combobox_szoveg, 30),
      combobox_szoveg = forcats::fct_inorder(combobox_szoveg),
      valasz_szovege = stringr::str_wrap(valasz_szovege, 50),
      valasz_szovege = forcats::fct_inorder(valasz_szovege),
    )
}
#' Wrangle discrete distribution question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_diszkret_eloszlas <- function(df, labels) {
  stop("Not implemented")
}
#' Wrangle other table question
#'
#' @param df A tibble with columns respondent_id, answer, kerdes
#' @param labels A tibble with question labels
#' @return Not implemented

survey_wrangle_table_egyeb <- function(df, labels) {
  stop("Not implemented")
}

likert_labeller <- function(df, likert_labels) {
  if (is.null(likert_labels)) {
    # If likert labels are missing, return identity function
    return(function(x) x)
  }

  df %>%
    dplyr::mutate(
      x_axis_label = dplyr::case_when(
        !is.na(likert_labels$first_label) ~ likert_labels$first_label,
        !is.na(likert_labels$last_label) ~ likert_labels$last_label,
        TRUE ~ as.character(answer)
      )
    )
}
