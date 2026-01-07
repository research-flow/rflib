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

Survey$questions[[21]] <- survey_add_reference(
    survey_obj = Survey,
    question_id = "21",
    reference_question_id = "5",
    rewrangle = TRUE
)
Survey$questions[[17]] <- survey_add_reference(
    survey_obj = Survey,
    question_id = "17",
    reference_question_id = "5",
    rewrangle = TRUE
)

survey_ggplot_likert_scale(
    question = Survey$questions[[17]]
)
