show_col_label <-
  function(colours, labels = TRUE, borders = NULL, cex_label = 1,
           ncol = NULL) {
    n <- length(colours)
    ncol <- ncol %||% ceiling(sqrt(length(colours)))
    nrow <- ceiling(n / ncol)
    colours <- c(colours, rep(NA, nrow * ncol - length(colours)))
    colours <- matrix(colours, ncol = ncol, byrow = TRUE)
    old <- par(pty = "s", mar = c(0, 0, 0, 0))
    on.exit(par(old))
    size <- max(dim(colours))
    plot(c(0, size), c(0, -size),
      type = "n", xlab = "", ylab = "",
      axes = FALSE
    )
    rect(col(colours) - 1, -row(colours) + 1, col(colours),
      -row(colours),
      col = colours, border = borders
    )
    if (labels) {
      hcl <- farver::decode_colour(colours, "rgb", "hcl")
      label_col <- ifelse(hcl[, "l"] > 50, "black", "white")
      text(col(colours) - 0.5, -row(colours) + 0.5, colours,
        cex = cex_label, col = label_col
      )
    }
  }
