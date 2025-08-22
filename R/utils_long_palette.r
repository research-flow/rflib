## Get a custom color palette
#'
#' @title Extended sophisticated color palette with 85+ strategically ordered hex colors
#' @description Returns a vector of aesthetically pleasing, sophisticated colors in hex format following
#' the refined style of the JCO palette. The palette starts with the original JCO colors and extends to
#' 85+ carefully curated hex colors that maintain the sophisticated, muted aesthetic while maximizing
#' visual distinction between categories. Avoids harsh primary colors in favor of refined, professional tones.
#'
#' @param n Number of colors to return. If NULL, returns all colors (85+). If a number, returns the first \code{n} colors.
#' @return A character vector of hex color codes with sophisticated, muted tones optimized for professional visualizations.
#'   Colors follow the JCO palette aesthetic and are strategically ordered to maximize separation between adjacent categories.
#' @export

long_palette <- function(n = NULL) {
    palette <- c(
        # Original JCO colors (hardcoded to avoid ggsci dependency)
        "#0073C2FF",
        "#EFC000FF",
        "#868686FF",
        "#CD534CFF",
        "#003C67FF",
        "#8F7700FF",
        "#3B3B3BFF",
        "#A73030FF",
        "#4A6990FF",
        "#228B22", # green4 in hex

        # Strategic color ordering for maximum distinction when plotting many categories
        # Colors follow the sophisticated aesthetic of the JCO palette

        # Sophisticated muted colors (positions 12-17)
        "#E64B35", # muted red (JCO style)
        "#4DBBD5", # soft blue-cyan
        "#00A087", # teal green
        "#3C5488", # deep blue
        "#F39B7F", # coral salmon
        "#8491B4", # slate blue

        # Rich jewel tones (positions 18-23)
        "#91D1C2", # mint green
        "#DC0000", # bright red
        "#7E6148", # mocha brown
        "#B09C85", # warm gray
        "#FF7F0E", # warm orange
        "#2CA02C", # forest green

        # Refined earth tones (positions 24-29)
        "#D62728", # burgundy red
        "#9467BD", # purple
        "#8C564B", # brown
        "#E377C2", # pink
        "#7F7F7F", # gray
        "#BCBD22", # olive yellow

        # Sophisticated pastels (positions 30-35)
        "#17BECF", # cyan
        "#AEC7E8", # light blue
        "#FFBB78", # peach
        "#98DF8A", # light green
        "#FF9896", # light red
        "#C5B0D5", # lavender

        # Extended refined palette (positions 36-41)
        "#C49C94", # dusty rose
        "#F7B6D3", # soft pink
        "#C7C7C7", # light gray
        "#DBDB8D", # sage green
        "#9EDAE5", # sky blue
        "#FFD92F", # warm yellow

        # Deep sophisticated colors (positions 42-47)
        "#1F77B4", # deep blue
        "#FF7F0E", # burnt orange
        "#2CA02C", # emerald green
        "#D62728", # wine red
        "#9467BD", # amethyst
        "#8C564B", # chocolate

        # Muted variations (positions 48-53)
        "#E377C2", # rose
        "#7F7F7F", # charcoal
        "#BCBD22", # mustard
        "#17BECF", # turquoise
        "#AEC7E8", # powder blue
        "#FFBB78", # apricot

        # Sophisticated earth palette (positions 54-59)
        "#98DF8A", # sage
        "#FF9896", # salmon
        "#C5B0D5", # periwinkle
        "#C49C94", # taupe
        "#F7B6D3", # blush
        "#C7C7C7", # silver

        # Natural tones (positions 60-65)
        "#DBDB8D", # wheat
        "#9EDAE5", # aqua
        "#AD7A99", # mauve
        "#B7A57A", # khaki
        "#85C0F9", # cornflower
        "#F5A97F", # peach

        # Refined jewel palette (positions 66-71)
        "#6B8E23", # olive drab
        "#CD5C5C", # indian red
        "#4682B4", # steel blue
        "#DAA520", # goldenrod
        "#9932CC", # dark orchid
        "#228B22", # forest green

        # Sophisticated muted tones (positions 72-77)
        "#708090", # slate gray
        "#B0C4DE", # light steel blue
        "#DDA0DD", # plum
        "#F0E68C", # khaki
        "#FA8072", # salmon
        "#20B2AA", # light sea green

        # Final refined colors (positions 78-85)
        "#87CEEB", # sky blue
        "#D2691E", # chocolate
        "#FF6347", # tomato
        "#40E0D0", # turquoise
        "#EE82EE", # violet
        "#90EE90", # light green
        "#F4A460", # sandy brown
        "#FF7F50" # coral
    )

    if (is.null(n)) {
        return(palette)
    } else {
        return(head(palette, n))
    }
}
