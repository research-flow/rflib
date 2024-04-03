#' @title Connect to RF Oracle schemes
#'
#' @importFrom DBI dbDriver
#' @importFrom ROracle dbConnect
#'
#' @description
#' `oracle_connect()` connects to RF schemes, with host, scheme name and password.
#'
#' @param scheme Character string. Existing scheme in the RF Oracle system
#' @param pwd Character string. Password connected to the scheme.
#' @param setLocale Boolean. If sys.setenv should be run tto set adequate Hungarian language options.
#' @returns An ROracle connection OraConnection object.
#'
#' @export

oracle_connect <- function(scheme, pwd, host, setLocale = F){

  if (setLocale){
    Sys.setenv(TZ = "CET")
    Sys.setenv(NLS_LANG="HUNGARIAN_HUNGARY.AL32UTF8")
    Sys.setenv(ORA_SDTZ = "CET")
  }

  drv <- DBI::dbDriver("Oracle")
  host_val = host
  port = 1521
  svc = "DBRF_fra1zg.subnet03261150.vcn03261150.oraclevcn.com"

  connect.string <- paste(
    "(DESCRIPTION=",
    "(ADDRESS=(PROTOCOL=tcp)(HOST=", host_val, ")(PORT=", port, "))",
    "(CONNECT_DATA=(SERVICE_NAME=", svc, ")))", sep = "")

  ROracle::dbConnect(drv,
                     username = scheme,
                     password = pwd,
                     dbname = connect.string,
                     encoding = "windows-1250"
  )

}
