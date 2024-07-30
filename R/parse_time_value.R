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
  if (time_type == "Éves") {
    return(as.Date(paste0(stringr::str_sub(time_value, 1, 4), "-01-01")))
  } else if (time_type == "QTR") {
    year <- substr(time_value, 1, 4)
    quarter <- substr(time_value, 6, 6)
    month <- (as.numeric(quarter) - 1) * 3 + 1
    return(as.Date(paste0(year, "-", sprintf("%02d", month), "-01")))
  } else if (time_type == "Havi") {
    if (grepl("M", time_value)) {
      year <- substr(time_value, 1, 4)
      month <- substr(time_value, 6, 7)
    } else {
      year <- substr(time_value, 1, 4)
      month <- substr(time_value, 5, 6)
    }
    return(as.Date(paste0(year, "-", sprintf("%02d", as.numeric(month)), "-01")))
  } else if (time_type == "Mozgó negyedév") {
    time_value_last  <- stringr::str_extract(time_value, "[0-9]+$")
    if (grepl("M", time_value_last)) {
      year <- substr(time_value_last, 1, 4)
      month <- substr(time_value_last, 6, 7)
    } else {
      year <- substr(time_value_last, 1, 4)
      month <- substr(time_value_last, 5, 6)
    }
    return(as.Date(paste0(year, "-", sprintf("%02d", as.numeric(month)), "-01")))
  } else if (time_type == "*Teljes időszak" && time_value == "*Teljes időszak") {
    return(as.Date("1900-01-01"))  # Arbitrary fixed date for total timeframe
  }
}
