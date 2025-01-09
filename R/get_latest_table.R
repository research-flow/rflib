#' @title Get latest tables from an Oracle scheme
#'
#' @description
#' `get_latest_table()` gets latest table lists from Oracle connections.
#'
#' @param table_name_val Character string. Filtering string to table names
#' @param sema_name_val Character string. Filtering string to schema names
#' @param tibble_of_tables Tibble. If previously all possible names are extracted, they can be set as default.
#' @param min_date Date string (YYMMDD), will be converted into date. Gives the minimum date for the search.
#' @param max_date Date string (YYMMDD), will be converted into date. Gives the maximum date for the search.
#' @param append append a text after the table
#' @returns A tibble with given table name patterns and their latest table names in an Oracle scheme.
#'
#' @export

get_latest_table <- function(table_name_val, sema_name_val, tibble_of_tables, min_date = NULL,max_date = NULL, append = "") {

  aval_tables <- tibble_of_tables %>% filter(con_val_keszlet == sema_name_val) %>% pull(list)
  min_date_val <-
    if(!is.null(min_date)){
      as.Date(min_date, "%y%m%d")
    } else {
      min_date
    }
  max_date_val <-
    if(!is.null(max_date)){
      as.Date(max_date, "%y%m%d")
    } else {
      max_date
    }

  if ((sum(str_detect(aval_tables, table_name_val))) == 0){
    table_name_val_final <- str_replace(table_name_val, "OUT", "P")
  } else {
    table_name_val_final <- table_name_val
  }

  if(table_name_val_final %in% aval_tables){
    return(table_name_val_final)
  } else {
    latest_table <- tibble_of_tables %>%
      filter(str_detect(list, str_c(table_name_val_final, "_(\\d{6})$")) & (con_val_keszlet == sema_name_val)) %>%
      mutate(date_suffix = as.Date(sub('.*_(\\d{6})$', '\\1', list, perl = TRUE), "%y%m%d")) %>%
      (\(x) {if(!is.null(min_date_val))
        filter(x, ((date_suffix == max(date_suffix)) & (max(date_suffix) <= max_date_val)) | is.na(date_suffix))
        else  if(!is.null(max_date_val))
          filter(x, ((date_suffix == max(date_suffix)) & (max(date_suffix) >= min_date_val)) | is.na(date_suffix))
        else
          filter(x, ((date_suffix == max(date_suffix))) | is.na(date_suffix))
      })() %>%
      pull(list)
    if (length(latest_table) > 0) {
      return(first(latest_table))
    } else {
      return(NA)
    }
  }
}

