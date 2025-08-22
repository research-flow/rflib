#' @title Validate time periods in tables
#'
#' @description
#' `validate_time_periods()` gets latest table lists from Oracle connections.
#'
#' @param idoszak_ertek Character vector. Tiem period values to analyse
#' @param idoszak_bontas Character vector with values as: "Éves", "Havi", "QTR", "*Teljes időszak"
#' @param min_date Date string (YYYY.MM.DD.), will be converted into date. Gives the minimum date for the search.
#' @param max_date Date string (YYYY.MM.DD.), will be converted into date. Gives the maximum date for the search.
#' @param output_boolean Boolean if just checking should be done or relabelling as well. TRUE = relabelling, FALSE = checking
#' @returns A vector with correct labels and NA for out of date range values.
#'
#' @export

# Function to validate labels based on idoszak_bontas
validate_time_periods <- function(idoszak_ertek, idoszak_bontas, min_date, max_date, output_boolean = F) {
  # Ensure min_date and max_date are Date objects
  min_date <- as.Date(min_date)
  max_date <- as.Date(max_date)

  relabel_list <-
    c(
      "Q1-Q4" = "",
      "Q1-Q2" = "H1",
      "Q3-Q4" = "H2",
      "Q1-Q1" = "Q1",
      "Q2-Q2" = "Q2",
      "Q3-Q3" = "Q3",
      "Q4-Q4" = "Q4"
    )

  # Check if lengths match
  if (length(idoszak_ertek) != length(idoszak_bontas)) {
    stop("Error: Length of idoszak_ertek must match idoszak_bontas.")
  }

  # Define valid quarter start and end dates
  quarter_starts <- seq(as.Date("1900-01-01"), as.Date("2100-01-01"), by = "quarter")
  quarter_ends <- quarter_starts + months(3) - lubridate::days(1)

  # Validate min_date and max_date
  if (!(min_date %in% quarter_starts)) stop(sprintf("Error: min_date (%s) is not the start of a quarter.", min_date))
  if (!(max_date %in% quarter_ends)) stop(sprintf("Error: max_date (%s) is not the end of a quarter.", max_date))

  # Generate valid ranges
  min_year <- lubridate::year(min_date)
  max_year <- lubridate::year(max_date)
  min_quarter <- lubridate::quarter(min_date)
  max_quarter <- lubridate::quarter(max_date)

  # Generate valid yearly labels
  valid_years <- c()
  for (year in min_year:max_year) {
    if (year == min_year) {
      valid_years <- c(valid_years, as.character(year), paste0(year, "Q", min_quarter, "-Q4"))
    } else if (year == max_year) {
      valid_years <- c(valid_years, as.character(year), paste0(year, "Q1-Q", max_quarter))
    } else {
      valid_years <- c(valid_years, as.character(year))
    }
  }
  valid_years <- stringr::str_replace_all(valid_years, relabel_list)

  # Generate valid yearly labels
  valid_quarters <- c()
  for (year in min_year:max_year) {
    if (year == min_year) {
      valid_quarters <- c(valid_quarters, paste0(year, "Q", min_quarter:4))
    } else if (year == max_year) {
      valid_quarters <- c(valid_quarters, paste0(year, "Q", 1:max_quarter))
    } else {
      valid_quarters <- c(valid_quarters, paste0(year, "Q", 1:4))
    }
  }

  valid_months <- format(seq(min_date, max_date, by = "month"), "%Y") %>%
    paste0("M", stringr::str_pad(lubridate::month(seq(min_date, max_date, by = "month")), 2, pad = "0"))

  # Handle "Éves" corrections
  yearly_indices <- which(idoszak_bontas == "Éves")
  yearly_labels <- idoszak_ertek[yearly_indices]
  yearly_flags <- yearly_labels %in% valid_years
  yearly_corrected <- ifelse(yearly_flags, yearly_labels, NA_character_)

  yearly_corrected <- ifelse(
    yearly_flags & yearly_labels == min_year & min_quarter > 1,
    paste0(min_year, "Q", min_quarter, "-Q4"),
    ifelse(
      yearly_flags & yearly_labels == max_year & max_quarter < 4,
      paste0(max_year, "Q1-Q", max_quarter),
      ifelse(yearly_flags, as.character(yearly_labels), NA_character_)
    )
  )

  yearly_corrected <- stringr::str_replace_all(yearly_corrected, relabel_list)

  # Handle "QTR" corrections
  quarter_indices <- which(idoszak_bontas == "QTR")
  quarter_flags <- idoszak_ertek[quarter_indices] %in% valid_quarters
  quarter_corrected <- ifelse(quarter_flags, idoszak_ertek[quarter_indices], NA_character_)

  # Handle "Havi" corrections
  monthly_indices <- which(idoszak_bontas == "Havi")
  monthly_flags <- idoszak_ertek[monthly_indices] %in% valid_months
  monthly_corrected <- ifelse(monthly_flags, idoszak_ertek[monthly_indices], NA_character_)

  # Merge corrections and flags
  corrected_labels <- idoszak_ertek
  corrected_labels[yearly_indices] <- yearly_corrected
  corrected_labels[quarter_indices] <- quarter_corrected
  corrected_labels[monthly_indices] <- monthly_corrected

  flags <- rep(FALSE, length(idoszak_ertek))
  flags[yearly_indices] <- !yearly_flags
  flags[quarter_indices] <- !quarter_flags
  flags[monthly_indices] <- !monthly_flags

  # Count relabeled values
  relabel_count <- sum(idoszak_ertek != corrected_labels | is.na(corrected_labels))

  if (relabel_count > 0) {
    warning(sprintf("Relabelled %s results", relabel_count))
  }

  if (output_boolean) {
    # Return results
    return(corrected_labels)
  } else {
    # Return input
    return(idoszak_ertek)
  }
}
