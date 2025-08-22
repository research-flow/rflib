## Integer Breaks for Axis Ticks
#'
#' Returns a function that computes axis breaks at integer values using `pretty` and `floor`.
#'
#' @param n Number of breaks (default is 5).
#' @param ... Additional arguments passed to `pretty`.
#' @return A function that takes a numeric vector and returns integer axis breaks.
#' @export

integer_breaks <- function(n = 5, ...) {
    function(x) {
        breaks <- floor(pretty(x, n, ...))
        # Remove breaks outside the range of x
        breaks <- breaks[breaks >= min(x, na.rm = TRUE) & breaks <= max(x, na.rm = TRUE)]
        names(breaks) <- attr(breaks, "labels")
        breaks
    }
}
