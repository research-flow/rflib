#' @title Reading xlsb files
#'
#' @description
#' `read_xlsb()` Reads xlsb files with the help of odbc connections
#'
#' @param path String The relative or absolute path of the file. Finishes in ".xlsb"
#' @param sheet String. Sheet in the xlsb document
#' @returns A tibble
#'
#' @export


read_xlsb <- function(path, sheet) {
  if (!endsWith(path, ".xlsb")) {
    stop("Path needs to end in .xlsb")
  } else {
    wb <- path # Give the file name
    con2 <- RODBC::odbcConnectExcel2007(wb)
    sheets <- stringr::str_remove_all(RODBC::sqlTables(con2)$TABLE_NAME, "[\\$\\']")

    if (!(sheet %in% sheets)) {
      stop(paste0("Sheet name must in the file sheet name!", paste0(sheets, collapse = ", ")))
    } else {
      data <- RODBC::sqlFetch(con2, sheet) %>% dplyr::tibble() # Provide name of sheet
      return(data)
    }
  }
}
