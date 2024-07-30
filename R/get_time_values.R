#' @title Get filtered time values
#'
#' @description
#' `get_time_values()` creates a date format from dates as text, based on the type of date e.g. converts 2023M01 to date 2023-01-01
#'
#' @param df Dataframe. Dataframe to mutate and convert its date texts to date formats.
#' @param time_type_col Character string. Colname in df, which corresponds to the time type column.
#' @param time_value_col Character string. Colname in df, which corresponds to the time value column.
#' @param time_type_out Character string. Time type to filter, can be Éves, Havi, QTR or Mozgó negyedév..
#' @param num_days Number. For extracting the first and last n values that contain not analysable values, a variable of number of days should be applied.
#' @param from_start Boolean. If the filtering should be from the start.
#' @returns A Date value
#'
#' @export

get_time_values <- function(df, time_type_out, time_type_col = "Időszak bontás",
                            time_value_col = "Időszak érték", num_days = 180,
                            from_start = TRUE) {
  # Parse time values
  altered_df <- df %>%
    dplyr::filter( !!sym(time_type_col) == time_type_out) |>
    dplyr::select(!!sym(time_type_col), !!sym(time_value_col)) |> unique() |>
    dplyr::mutate(parsed_time_value = purrr::map2_dbl(!!sym(time_type_col), !!sym(time_value_col),
                                        parse_time_value),
           parsed_time_value = as.Date(parsed_time_value, origin = as.Date("1970-01-01"))) |>
    dplyr::arrange(parsed_time_value)

  # Determine the reference date
  if (from_start) {
    reference_date <- min(altered_df$parsed_time_value)
    end_date <- reference_date + days(num_days)
    filtered_df <- altered_df %>%
      dplyr::filter(parsed_time_value <= end_date)
  } else {
    reference_date <- max(altered_df$parsed_time_value)
    start_date <- reference_date - days(num_days)
    filtered_df <- altered_df %>%
      dplyr::filter(parsed_time_value >= start_date)
  }

  # Remove the parsed_time_value column
  filtered_values <- filtered_df %>%
    dplyr::filter(!!sym(time_type_col) == time_type_out) |>
    dplyr::select(-parsed_time_value) |>
    dplyr::pull(!!sym(time_value_col)) |> unique()

  return(filtered_values)
}
