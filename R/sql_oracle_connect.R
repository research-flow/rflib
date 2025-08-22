#' @title Connect to RF Oracle schemes
#'
#' @importFrom odbc dbConnect
#' @importFrom odbc odbc
#'
#' @description
#' `oracle_connect()` connects to RF schemes, with host, scheme name and password.
#'
#' @param schema Character string. Existing scheme in the RF Oracle system
#' @param setLocale Boolean. If sys.setenv should be run tto set adequate Hungarian language options.
#' @returns An ROracle connection OraConnection object.
#'
#' @export

oracle_connect <- function(schema, setLocale = T) {
  if (setLocale) {
    Sys.setenv(TZ = "CET")
    Sys.setenv(NLS_LANG = "HUNGARIAN_HUNGARY.AL32UTF8")
    Sys.setenv(ORA_SDTZ = "CET")
  }

  odbc::dbConnect(
    odbc::odbc(),
    DSN = "RFLOW - Oracle",
    UID = toupper(schema),
    PWD = Sys.getenv(paste0("OCI_", toupper(schema), "_PW")),
    encoding = ""
  )
}
