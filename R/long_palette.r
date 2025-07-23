## Get a custom color palette
#'
#' @title Custom color palette for survey plots
#' @description Returns a vector of colors for use in survey visualizations. If \code{n} is NULL, returns the whole palette. If \code{n} is a number, returns the first \code{n} colors.
#'
#' @param n Number of colors to return. If NULL, returns all colors.
#' @return A character vector of colors.
#' @importFrom ggsci pal_jco pal_aaas
#' @importFrom ggplot2 alpha
#' @export

long_palette <- function(n = NULL) {
    palette <- c(
        ggsci::pal_jco()(10),
        "green4",
        ggsci::pal_aaas()(10)
    )
    if (is.null(n)) {
        return(palette)
    } else {
        return(head(palette, n))
    }
}
