
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rflib

<!-- badges: start -->

<!-- badges: end -->

Research Flow utility package (v2.0.0.0) for internal use, providing
enhanced functions for survey data processing, SQL operations, and
general utilities. This major version update brings improved
organization, better error handling, and modern CLI-based user
interactions.

## Installation

You can install the development version of rflib from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("research-flow/rflib")
```

## Survey Functions

### Survey Data Processing

The package provides comprehensive tools for survey data handling and
visualization:

``` r
# Generate survey presentation
generate_survey_presentation(
  input_file = "survey_data.xlsx",
  output_dir = "results",
  template = "standard"
)

# Create interactive visualizations
survey_echarts_likert_scale(question_data)
survey_echarts_col_eloszlas(response_data)
```

### Key Survey Functions

- `generate_survey_presentation()`: Create comprehensive survey reports
- `survey_add_question()`: Add new questions to survey objects
- `survey_add_definition()`: Define survey parameters
- `survey_add_type()`: Specify question types

### Visualization Options

- Static plots (ggplot2-based):
  - `survey_ggplot_likert_scale()`
  - `survey_ggplot_col_eloszlas()`
  - `survey_ggplot_hoterkep()`
- Interactive plots (echarts-based):
  - `survey_echarts_likert_scale()`
  - `survey_echarts_col_eloszlas()`
  - `survey_echarts_hoterkep()`

## SQL Functions

### Database Operations

Tools for efficient SQL operations and file generation:

``` r
# Generate SQL from Excel
generate_oracle_insert_sql_from_excel(
  excel_path = "data.xlsx",
  sheet = "Sheet1",
  table_name = "MY_TABLE"
)

# Generate source files
generate_source_file(
  source_dir = "R/",
  schema = "RFLOW"
)
```

### Key SQL Functions

- `generate_oracle_insert_sql_from_excel()`: Convert Excel data to
  Oracle SQL
- `generate_source_file()`: Create source files with database
  connections
- `oracle_connect()`: Establish database connections

## Utility Functions

### General Utilities

Various helper functions for data processing and visualization:

``` r
# Color utilities
get_optimal_font_color("#FFFFFF")

# Time handling
parse_time_value("2h 30m")
get_time_values("2:30")
```

### Key Utility Functions

- Color Management:
  - `get_optimal_font_color()`
  - `long_palette()`
- Time Handling:
  - `parse_time_value()`
  - `get_time_values()`
- Data Processing:
  - `integer_breaks()`
  - `read_xlsb()`

## Changelog

### Version 2.0.0.0 (Current)

- Major version update
- Complete reorganization of package structure
- Enhanced survey functionality
- Improved SQL generation tools
- New template system for source file generation
- Better error handling and user feedback
- Modern CLI-based user interactions

### Version 1.0.8.0

- Added automatic pipe operator detection and replacement
- Improved error handling in survey presentation generation
- Enhanced SQL template validation

### Version 1.0.7.0

- Added survey presentation generation functions
- Improved echarts integration
- Enhanced Excel to SQL conversion with type detection

### Version 1.0.6.0

- Added interactive survey visualization functions
- Improved database connection handling
- Enhanced error reporting in SQL generation

### Version 1.0.5.0

- Initial public release
- Basic survey processing functionality
- SQL generation tools
- Core utility functions
