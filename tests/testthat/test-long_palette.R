test_that("long_palette returns correct number of colors", {
    # Test getting all colors
    all_colors <- long_palette()
    expect_true(length(all_colors) >= 80)
    expect_true(is.character(all_colors))

    # Test getting specific number of colors
    first_10 <- long_palette(10)
    expect_equal(length(first_10), 10)
    expect_true(is.character(first_10))

    # Test getting more colors than available
    many_colors <- long_palette(1000)
    expect_equal(length(many_colors), length(all_colors))

    # Test that first colors match when requesting subset
    first_5 <- long_palette(5)
    expect_equal(first_5, all_colors[1:5])
})

test_that("long_palette colors are valid hex codes", {
    colors <- long_palette()

    # All colors should be valid color specifications
    for (color in colors) {
        expect_true(nchar(color) > 0, info = paste("Empty color found:", color))
        expect_true(is.character(color))
    }

    # Check that all colors after the first 10 (JCO) are in hex format
    non_jco_colors <- colors[12:length(colors)] # Skip JCO colors and green4
    for (color in non_jco_colors) {
        expect_true(grepl("^#[0-9A-Fa-f]{6}$", color),
            info = paste("Non-hex color found:", color)
        )
    }

    # No duplicate colors (important for distinction)
    expect_equal(length(colors), length(unique(colors)))
})

test_that("long_palette has strategic color ordering", {
    colors <- long_palette(80)

    # Test that adjacent colors are visually distinct by checking they're not similar hues
    # This is a basic check - in practice, you'd want more sophisticated color distance metrics

    # Check that we don't have identical adjacent colors
    for (i in 1:(length(colors) - 1)) {
        expect_false(colors[i] == colors[i + 1],
            info = paste("Adjacent identical colors at positions", i, "and", i + 1)
        )
    }

    # Check that high contrast colors appear early in the sequence
    high_contrast_colors <- c("#FF0000", "#0000FF", "#32CD32", "#FF69B4", "#FFD700")
    early_colors <- colors[12:20] # Skip JCO colors, check next 9

    # At least some high contrast colors should appear early
    expect_true(any(high_contrast_colors %in% early_colors),
        info = "High contrast colors should appear early in sequence"
    )
})

test_that("long_palette starts with expected colors", {
    colors <- long_palette()

    # Should start with JCO colors (minus 5th) plus green4 in hex
    jco_colors <- ggsci::pal_jco()(10)[-5]
    expected_start <- c(jco_colors, "#228B22") # green4 in hex

    actual_start <- colors[seq_along(expected_start)]
    expect_equal(actual_start, expected_start)
})

test_that("long_palette handles edge cases", {
    # Test n = 0
    expect_equal(long_palette(0), character(0))

    # Test n = 1
    first_color <- long_palette(1)
    expect_equal(length(first_color), 1)
    expect_equal(first_color, ggsci::pal_jco()(10)[-5][1])

    # Test negative n (should return empty)
    expect_equal(long_palette(-1), character(0))
})

test_that("long_palette provides sufficient colors for many categories", {
    colors <- long_palette()

    # Should have at least 80 colors for large categorical data
    expect_true(length(colors) >= 80)

    # Test that we can get 80 distinct colors
    colors_80 <- long_palette(80)
    expect_equal(length(colors_80), 80)
    expect_equal(length(unique(colors_80)), 80) # All should be unique
})

test_that("long_palette color progression makes sense", {
    colors <- long_palette()

    # First color should be from JCO palette
    expect_equal(colors[1], ggsci::pal_jco()(10)[-5][1])

    # Should contain the added green4 in hex format
    expect_true("#228B22" %in% colors[1:11])

    # Should contain some basic distinct colors in hex format
    basic_hex_colors <- c("#FF0000", "#0000FF", "#32CD32", "#FF69B4", "#FFD700")
    expect_true(any(basic_hex_colors %in% colors))

    # Check that strategic ordering is maintained
    expect_equal(colors[12], "#FF0000") # red should be first after JCO+green4
    expect_equal(colors[13], "#0000FF") # blue should be second
})

# Visual test (for manual inspection)
test_that("long_palette can be visualized", {
    skip_on_ci() # Skip on CI since it requires graphics

    colors <- long_palette(50) # Test first 50 colors

    # This would create a plot to visually inspect color distinction
    # In practice, run this manually to check colors
    expect_true(length(colors) == 50)
})
