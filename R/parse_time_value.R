#' @title Convert date texts to date format
#'
#' @description
#' `parse_time_value()` creates a date format from dates as text, based on the type of date e.g. converts 2023M01 to date 2023-01-01
#'
#' @param time_type Character string. Type can be Éves, QTR, Havi, Mozgó negyedév or *Teljes időszak
#' @param time_value Character string. Date as a text format
#' @returns A Date value
#'
#' @export

parse_time_value <- function(time_type, time_value) {

  dplyr::case_when(
    # Case for "Éves"
    time_type == "Éves" ~ as.Date(paste0(substr(time_value, 1, 4), "-01-01")),

    # Case for "QTR"
    time_type == "QTR" ~ {
      year <- substr(time_value, 1, 4)
      quarter <- as.numeric(substr(time_value, 6, 6))
      month <- (quarter - 1) * 3 + 1
      as.Date(paste0(year, "-", sprintf("%02d", month), "-01"))
    },

    # Case for "Havi"
    time_type == "Havi" ~ {
      year <- ifelse(grepl("M", time_value), substr(time_value, 1, 4), substr(time_value, 1, 4))
      month <- ifelse(grepl("M", time_value), substr(time_value, 6, 7), substr(time_value, 5, 6))
      as.Date(paste0(year, "-", sprintf("%02d", as.numeric(month)), "-01"))
    },

    # Case for "Mozgó negyedév"
    time_type == "Mozgó negyedév" ~ {
      time_value_last <- stringr::str_extract(time_value, "[0-9]+$")
      year <- ifelse(grepl("M", time_value_last), substr(time_value_last, 1, 4), substr(time_value_last, 1, 4))
      month <- ifelse(grepl("M", time_value_last), substr(time_value_last, 6, 7), substr(time_value_last, 5, 6))
      as.Date(paste0(year, "-", sprintf("%02d", as.numeric(month)), "-01"))
    },

    # Case for "*Teljes időszak"
    time_type == "*Teljes időszak" & time_value == "*Teljes időszak" ~ as.Date("1900-01-01"),

    # Default case: NA if none match
    TRUE ~ NA_Date_
  )
}
