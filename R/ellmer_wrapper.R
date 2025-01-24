#' Process Excel File with ChatGPT (Ellmer Wrapper)
#'
#' This function wraps around the Ellmer library to process textual columns in an input Excel file
#' using ChatGPT. It categorizes textual data in each column based on the corresponding labels and
#' cleans the data accordingly.
#'
#' @param file_path The path to the input Excel file.
#' @param output_path The path to save the modified Excel file (optional).
#' @param api_key Your OpenAI API key for Ellmer.
#' @param num_categories Number of categories to create for each textual column (default: 5).
#' @return A modified dataframe with the categorized data.

process_excel_with_ellmer <- function(file_path, output_path = NULL, api_key = Sys.getenv("OPENAPI_KEY_MR"), num_categories = 5) {
  # Load the input Excel file
  raw_data <- read.xlsx(file_path, sheet = 1)
  label_data <- read.xlsx(file_path, sheet = "Label")

  # Validate that the label file contains the necessary column
  if (!"Válasz.típusa" %in% colnames(label_data)) {
    stop("The 'Válasz típusa' column is missing from the label sheet.")
  }

  # Identify columns to clean based on labels

  flagged_cols <- sapply(raw_data, function(column) {
    filtered_values <- unique(column[!is.na(column) & is.na(as.numeric(column)) & tolower(trimws(as.character(column))) != "on"])
    return(length(filtered_values) > 1)
  })
  flagged_col_names <- names(flagged_cols)[flagged_cols]


  if (length(flagged_col_names) == 0) {
    stop("No textual columns found to clean based on the label sheet.")
  }

  # Process each identified textual column
  for (col_name in flagged_col_names) {
    unique_texts <- unique(raw_data[[col_name]])

    # Use Ellmer to generate categories for unique values
    # results <- sapply(unique_texts, function(text) {
    prompt <- stringr::str_c(
      "Magyar nyelvű kvalitatív kutatásra szöveges válaszokat adok.
      Formázd a következő szöveget úgy, hogy az összes variációt és különböző formátumú (kis- és nagybetűk, ékezetek, szóközök, kötőjelek, speciális karakterek) kifejezést egységesen egy formátumba cseréld. Az egységesítés célja, hogy minden kifejezés ugyanazt a szót, nevet vagy kifejezést képviselje. Kérlek, cseréld le az olyan változókat, mint a különböző írásmódú változatok, ékezetek nélküli változatok, szóközökkel vagy kötőjelekkel írt formák és egyéb eltérések. Az alapvető irányelv, hogy az összes változat ugyanarra az egy formára legyen alakítva, bármely szó vagy kifejezés legyen azonos a teljes szövegen belül.
      A szöveges válaszok ';'-al elválasztva: ",
      paste0(unique_texts, collapse = ";"), ";"
    )

    category <- type_object(
      items = type_array("Formatted texts:", items = type_string())
    )

    chat <- ellmer::chat_openai(
      model = "gpt-4o-mini",
      api_key = api_key)
    #> Using model = "gpt-4o".
    data <- chat$extract_data(prompt, type = category)

    return(trimws(category))
    # })

    # Map the generated categories back to the dataframe
    classification_map <- setNames(results, unique_texts)
    raw_data[[col_name]] <- classification_map[raw_data[[col_name]]]
  }

  # Save the modified Excel file if output_path is provided
  if (!is.null(output_path)) {
    write.xlsx(raw_data, output_path, overwrite = TRUE)
  }

  return(raw_data)
}
