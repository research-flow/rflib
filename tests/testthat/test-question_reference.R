# Test for Question Reference Functionality
# Testing the new survey_add_reference function and reference structure

library(testthat)
library(dplyr)
library(tibble)
library(tidyverse)

devtools::load_all()
Survey <- survey_init("inst/extdata/mock_data_raw.xlsx")

Survey <- survey_add_definition(
    Survey,
    "inst/extdata/mock_data_seged.xlsx",
    rewrangle = TRUE
)

Survey <- survey_add_all_references(
    survey_obj = Survey,
    rewrangle = TRUE
)

survey_ggplot_likert_scale(
    Survey$questions[[11]]
)
