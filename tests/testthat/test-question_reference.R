# Test for Question Reference Functionality
# Testing the new survey_add_reference function and reference structure

library(testthat)
library(dplyr)
library(tibble)

Survey <- survey_init("inst/extdata/mock_data_raw.xlsx")

Survey <- survey_add_definition(
    Survey,
    "inst/extdata/mock_data_seged.xlsx"
)

Survey$questions[[11]]
Survey$questions[[11]]$wrangled$valasz_szovege
Survey$questions[[18]]$label
Survey$questions[[5]]$data


Survey <- survey_add_reference(
    survey_obj = Survey,
    question_id = 11,
    reference_question_id = 5
)

Survey$questions[[11]]$data
