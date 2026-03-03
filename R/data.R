#' Regional Shape Data
#'
#' Spatial data object containing regional boundaries and shape information 
#' for Hungarian regions. Used for creating regional distribution maps 
#' in survey visualization functions.
#'
#' @format An sf object with regional shape data for Hungary:
#' \describe{
#'   \item{NUTS_NAME}{Region name}
#'   \item{geometry}{Spatial geometry data}
#'   ...
#' }
#' @source Hungarian spatial data source
"regio_shape"

#' Territorial Dictionary
#'
#' Dictionary data containing territorial codes and names for Hungarian 
#' administrative regions. Used for mapping territorial data in survey 
#' analysis and visualization functions.
#'
#' @format A data frame with territorial mapping information:
#' \describe{
#'   \item{code}{Territorial code}
#'   \item{name}{Territorial name}
#'   \item{region}{Regional classification}
#'   ...
#' }
#' @source Hungarian territorial classification system
"teruleti_szotar"