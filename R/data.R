#' Regional Dictionary Dataset
#'
#' A dataset containing the mapping between postal codes, counties, and regions in Hungary.
#'
#' @format A data frame with 3 variables:
#' \describe{
#'   \item{iranyitoszam}{Character. Hungarian postal codes}
#'   \item{megye_nev}{Character. County names}
#'   \item{regio_nev}{Character. Region names}
#'   \item{telepules_nev}{Character. Settlement names}
#' }
#' @source Internal research data
"teruleti_szotar"

#' Regional Shapes Dataset
#'
#' A dataset containing geometric and demographic information for Hungarian regions.
#'
#' @format A data frame with 4 variables:
#' \describe{
#'   \item{NUTS_NAME}{Character. Region names}
#'   \item{geometry}{Character. Simplified geometry data (use sf objects in production)}
#' }
#' @source Internal research data
"regio_shape"
