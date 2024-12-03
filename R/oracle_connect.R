#' @title Connect to RF Oracle schemes
#'
#' @importFrom odbc dbConnect
#' @importFrom odbc odbc
#'
#' @description
#' `oracle_connect()` connects to RF schemes, with host, scheme name and password.
#'
#' @param schema Character string. Existing scheme in the RF Oracle system
#' @param driverName Character string. Driver name
#' @param setLocale Boolean. If sys.setenv should be run tto set adequate Hungarian language options.
#' @returns An ROracle connection OraConnection object.
#'
#' @export

oracle_connect <- function(schema, driverName = "Oracle in instantclient_21_15", setLocale = T){

  if (setLocale){
    Sys.setenv(TZ = "CET")
    Sys.setenv(NLS_LANG="HUNGARIAN_HUNGARY.AL32UTF8")
    Sys.setenv(ORA_SDTZ = "CET")
  }

  host_val = Sys.getenv("OCI_HOST")
  port_val = Sys.getenv("OCI_PORT")
  svc_val = Sys.getenv("OCI_SVC")

  connect_string <- paste0(
    "(DESCRIPTION=",
    "(ADDRESS=(PROTOCOL=tcp)(HOST=", host_val, ")(PORT=", port_val, "))",
    "(CONNECT_DATA=(SERVICE_NAME=", svc_val, ")))")

  odbc::dbConnect(
    odbc::odbc(),
    Driver = driverName,
    DBQ = connect_string,
    UID = schema,
    PWD = Sys.getenv(paste0("OCI_", schema, "_PW")),
    encoding = "windows-1250"
  )
}
