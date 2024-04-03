#' @title Get latest tables from an Oracle scheme
#'
#' @import dplyr
#' @importFrom tidyr unnest
#' @importFrom ROracle dbGetInfo
#' @importFrom ROracle dbListTables
#' @importFrom purrr map
#' @importFrom purrr map_chr
#'
#' @description
#' `get_latest_table()` gets latest table lists from Oracle connections.
#'
#' @param table_name_val Character string. Filtering string to table names
#' @param connection_val List of OraConnection objects. In which we search for table names.
#' @param tibble_of_tables Tibble. If previously all possible names are extracted, they can be set as default.
#' @param list_tables Boolean. If return should be total table names or only the latest ones.
#' @returns A tibble with given table name patterns and their latest table names in an Oracle scheme.
#'
#' @export

get_latest_table <- function(table_name_val, connection_val, tibble_of_tables = NULL, list_tables = F) {

  if(!is.null(tibble_of_tables)){
    table_to_filter <- tibble_of_tables
  } else {
    table_to_filter <-
      dplyr::tibble(connections = c(connection_val)) |>
      dplyr::mutate(
        con_names =
          purrr::map_chr(connections, function(x) ROracle::dbGetInfo(x)$username),
        list =
          purrr::map(connections, function(x) ROracle::dbListTables(x))
      ) |>
      tidyr::unnest(list) |>
      dplyr::select(-connections)
  }

  latest_table <- table_to_filter |>
    dplyr::filter(grepl(table_name_val, list)
                  # & (con_names == sema_name_val)
    ) |>
    dplyr::mutate(date_suffix = as.Date(sub('.*_(\\d{6})$', '\\1', list, perl = TRUE), "%y%m%d"),
                  name = sub('(.*)_\\d{6}$', '\\1', list)) |>
    tidyr::drop_na(date_suffix) |>
    dplyr::group_by(con_names, name) |>
    dplyr::filter(date_suffix == max(date_suffix)) |>
    dplyr::ungroup() |>
    dplyr::select(-date_suffix, -name)

  if(list_tables) {
    return(table_to_filter)
  } else if (length(latest_table) > 0) {
    return(latest_table)
  } else {
    return(NULL)
  }
}
