#' Translation utility function for rflib package
#' 
#' Retrieves translated text for plot labels and chart elements based on language setting.
#' Falls back to Hungarian if translation is not available.
#' 
#' @param key Character string. Translation key with txt_ prefix (e.g., "txt_avg_resp_rate_pct")
#' @param language Character string. Language code ("hu" for Hungarian, "en" for English)
#' @param ... Additional parameters for string formatting (passed to sprintf if needed)
#' 
#' @return Character string with translated text
#' 
#' @examples
#' \dontrun{
#' translate("txt_avg_resp_rate_pct", "en")  # Returns "Average Response Rate (%)"
#' translate("txt_avg_resp_rate_pct", "hu")  # Returns "Átlagos válasz arány (%)"
#' }
#' 
#' @export
translate <- function(key, language = "hu", ...) {
  # Load translations from package data
  translations_path <- system.file("extdata", "translations.json", package = "rflib")
  
  if (!file.exists(translations_path)) {
    warning("Translation file not found. Returning key: ", key)
    return(key)
  }
  
  tryCatch({
    translations <- jsonlite::fromJSON(translations_path, simplifyVector = FALSE)
    
    # Check if key exists
    if (!key %in% names(translations)) {
      warning("Translation key not found: ", key, ". Returning key.")
      return(key)
    }
    
    translation_entry <- translations[[key]]
    
    # Check if it's a translation entry (not metadata)
    if (!is.list(translation_entry) || is.null(translation_entry[[language]])) {
      # Fallback to Hungarian if language not available
      if (language != "hu" && !is.null(translation_entry[["hu"]])) {
        warning("Translation not available for language '", language, "' for key '", key, "'. Using Hungarian.")
        result <- translation_entry[["hu"]]
      } else {
        warning("No translation available for key: ", key, ". Returning key.")
        return(key)
      }
    } else {
      result <- translation_entry[[language]]
    }
    
    # Apply formatting if additional parameters provided
    if (length(list(...)) > 0) {
      result <- do.call(sprintf, c(list(result), list(...)))
    }
    
    return(result)
    
  }, error = function(e) {
    warning("Error loading translations: ", e$message, ". Returning key: ", key)
    return(key)
  })
}