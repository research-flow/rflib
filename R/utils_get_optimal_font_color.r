#' Get optimal font color for hex colors
#'
#' @title Compute optimal font color (black or white) for given hex background colors
#' @description This function determines whether black or white text would be most readable
#' on a given background color by calculating the relative luminance of the background color.
#' @param hex_colors A character vector of hex color codes (with or without # prefix)
#' @return A character vector of "black" or "white" indicating the optimal font color for each input
#' @export
get_optimal_font_color <- function(hex_colors) {
    # Function to compute optimal font color for a single hex value
    compute_font_color <- function(hex_color) {
        # Remove the hash symbol if present
        hex_color <- gsub("#", "", hex_color)

        # Convert hex to RGB values
        r <- strtoi(substr(hex_color, 1, 2), base = 16)
        g <- strtoi(substr(hex_color, 3, 4), base = 16)
        b <- strtoi(substr(hex_color, 5, 6), base = 16)

        # Calculate relative luminance
        luminance <- (0.2126 * (r / 255)^2.2) +
            (0.7152 * (g / 255)^2.2) +
            (0.0722 * (b / 255)^2.2)

        # Determine optimal font color
        if (luminance > 0.179) {
            return("black") # Light background, use black text
        } else {
            return("white") # Dark background, use white text
        }
    }

    # Apply the function to each element in the input vector
    sapply(hex_colors, compute_font_color)
}
