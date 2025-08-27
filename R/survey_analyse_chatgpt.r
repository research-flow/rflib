# #' Analyze survey results using ChatGPT
# #'
# #' This function sends survey data (wrangled data and/or plot description) to ChatGPT
# #' for analysis and insights. It provides a simple interface without complex type declarations.
# #'
# #' @param question A SurveyQuestion object or wrangled data frame
# #' @param plot_obj Optional ggplot or echarts object to describe
# #' @param analysis_type Type of analysis: "summary", "insights", "recommendations", "detailed"
# #' @param language Language for the analysis (default: "Hungarian")
# #' @param custom_prompt Optional custom prompt to add to the analysis request
# #' @param api_key OpenAI API key (default: Sys.getenv("OPENAI_API_KEY"))
# #' @param model ChatGPT model to use (default: "gpt-4o")
# #' @return Character string with ChatGPT's analysis
# #' @export
# survey_analyze_with_chatgpt <- function(question,
#                                         plot_obj = NULL,
#                                         analysis_type = "summary",
#                                         language = "Hungarian",
#                                         custom_prompt = NULL,
#                                         api_key = Sys.getenv("OPENAI_API_KEY"),
#                                         model = "gpt-4o") {
#   # Validate inputs
#   if (api_key == "") {
#     stop("OpenAI API key not found. Please set OPENAI_API_KEY environment variable.")
#   }

#   if (!analysis_type %in% c("summary", "insights", "recommendations", "detailed")) {
#     stop("analysis_type must be one of: summary, insights, recommendations, detailed")
#   }

#   # Extract data for analysis
#   analysis_data <- .extract_analysis_data(question, plot_obj)

#   # Create system prompt
#   system_prompt <- .create_system_prompt(language)

#   # Create analysis prompt
#   analysis_prompt <- .create_analysis_prompt(
#     analysis_data,
#     analysis_type,
#     language,
#     custom_prompt
#   )

#   category <- ellmer::type_object(
#     items = ellmer::type_array("Formatted texts:", items = ellmer::type_string())
#   )

#   tryCatch(
#     {
#       # Set custom timeout
#       # .set_ellmer_timeout()

#       # Create chat instance
#       chat <- ellmer::chat_openai(
#         model = model,
#         api_key = api_key,
#         system_prompt = system_prompt
#       )
#       chat$chat_structured(analysis_prompt, type = category)

#       # Get analysis
#       result <- chat$chat(analysis_prompt)

#       message("Analysis completed successfully")
#       return(result)
#     },
#     error = function(e) {
#       warning(paste("Error during ChatGPT analysis:", e$message))
#       return(paste("Analysis failed:", e$message))
#     }
#   )
# }

# #' Quick survey insight generation
# #'
# #' Simplified function for getting quick insights from survey data
# #'
# #' @param question SurveyQuestion object or data frame
# #' @param language Language for insights (default: "Hungarian")
# #' @param focus_area What to focus on: "trends", "outliers", "patterns", "all"
# #' @return Character string with insights
# #' @export
# survey_quick_insights <- function(question,
#                                   language = "Hungarian",
#                                   focus_area = "all") {
#   survey_analyze_with_chatgpt(
#     question = question,
#     analysis_type = "insights",
#     language = language,
#     custom_prompt = switch(focus_area,
#       "trends" = "Focus on identifying trends and patterns in the data.",
#       "outliers" = "Focus on identifying outliers and unusual responses.",
#       "patterns" = "Focus on identifying response patterns and correlations.",
#       "all" = "Provide comprehensive insights covering trends, patterns, and key findings."
#     )
#   )
# }

# #' Generate survey recommendations
# #'
# #' Get actionable recommendations based on survey results
# #'
# #' @param question SurveyQuestion object or data frame
# #' @param context Optional context about the survey purpose
# #' @param language Language for recommendations (default: "Hungarian")
# #' @return Character string with recommendations
# #' @export
# survey_get_recommendations <- function(question,
#                                        context = NULL,
#                                        language = "Hungarian") {
#   custom_prompt <- if (!is.null(context)) {
#     paste(
#       "Survey context:", context,
#       "Based on this context, provide actionable recommendations."
#     )
#   } else {
#     "Provide actionable recommendations based on the survey results."
#   }

#   survey_analyze_with_chatgpt(
#     question = question,
#     analysis_type = "recommendations",
#     language = language,
#     custom_prompt = custom_prompt
#   )
# }

# # Helper functions
# .extract_analysis_data <- function(question, plot_obj) {
#   data_summary <- list()

#   # Handle different input types
#   if (inherits(question, "SurveyQuestion")) {
#     # Extract from SurveyQuestion object
#     if (!is.null(question$wrangled) && nrow(question$wrangled) > 0) {
#       data_summary$wrangled_summary <- .summarize_dataframe(question$wrangled)
#     }

#     if (!is.null(question$data) && nrow(question$data) > 0) {
#       data_summary$raw_summary <- .summarize_dataframe(question$data)
#     }

#     data_summary$question_type <- question$tipus %||% "unknown"
#     data_summary$question_id <- question$id %||% "unknown"
#     data_summary$n_respondents <- question$n_respondent %||% nrow(question$data)
#   } else if (is.data.frame(question)) {
#     # Handle direct data frame input
#     data_summary$data_summary <- .summarize_dataframe(question)
#     data_summary$n_rows <- nrow(question)
#   }

#   # Add plot information if provided
#   if (!is.null(plot_obj)) {
#     data_summary$plot_type <- class(plot_obj)[1]

#     if (inherits(plot_obj, "ggplot")) {
#       data_summary$plot_info <- "ggplot visualization provided"
#     } else if (inherits(plot_obj, "echarts4r")) {
#       data_summary$plot_info <- "echarts4r visualization provided"
#     } else {
#       data_summary$plot_info <- "visualization object provided"
#     }
#   }

#   return(data_summary)
# }

# .summarize_dataframe <- function(df) {
#   if (is.null(df) || nrow(df) == 0) {
#     return("No data available")
#   }

#   summary_parts <- c()

#   # Basic info
#   summary_parts <- c(summary_parts, paste("Rows:", nrow(df), "Columns:", ncol(df)))

#   # Column info
#   if (ncol(df) > 0) {
#     col_info <- paste("Columns:", paste(names(df), collapse = ", "))
#     summary_parts <- c(summary_parts, col_info)

#     # Numeric summaries
#     numeric_cols <- sapply(df, is.numeric)
#     if (any(numeric_cols)) {
#       for (col in names(df)[numeric_cols]) {
#         if (length(unique(df[[col]])) <= 20) { # If few unique values, show distribution
#           value_counts <- table(df[[col]])
#           summary_parts <- c(
#             summary_parts,
#             paste(col, "distribution:", paste(names(value_counts), "=", value_counts, collapse = ", "))
#           )
#         } else { # If many values, show summary stats
#           summary_parts <- c(
#             summary_parts,
#             paste(col, "range:", min(df[[col]], na.rm = TRUE), "-", max(df[[col]], na.rm = TRUE))
#           )
#         }
#       }
#     }

#     # Character/factor summaries
#     char_cols <- sapply(df, function(x) is.character(x) || is.factor(x))
#     if (any(char_cols)) {
#       for (col in names(df)[char_cols]) {
#         unique_vals <- unique(as.character(df[[col]]))
#         if (length(unique_vals) <= 10) {
#           summary_parts <- c(
#             summary_parts,
#             paste(col, "values:", paste(unique_vals, collapse = ", "))
#           )
#         } else {
#           summary_parts <- c(
#             summary_parts,
#             paste(col, "unique values:", length(unique_vals))
#           )
#         }
#       }
#     }
#   }

#   return(paste(summary_parts, collapse = "\n"))
# }

# .create_system_prompt <- function(language) {
#   if (language == "Hungarian") {
#     return(paste(
#       "Te egy szakértő adatelemző vagy, aki kérdőívek eredményeit elemzi.",
#       "A feladatod, hogy részletes és hasznos elemzést készíts a megadott adatok alapján.",
#       "Legyél konkrét, informatív és praktikus a válaszaidban.",
#       "Maximum 2 mondtatban foglald össze.",
#       "Ha lehetséges, adj számszerű adatokat és konkrét megállapításokat."
#     ))
#   } else {
#     return(paste(
#       "You are an expert data analyst specializing in survey research.",
#       "Your task is to provide detailed and useful analysis based on the provided data.",
#       "Be specific, informative and practical in your responses.",
#       "Provide maximum of 2 sentences",
#       "Include quantitative data and concrete findings when possible."
#     ))
#   }
# }

# .create_analysis_prompt <- function(data_summary, analysis_type, language, custom_prompt) {
#   # Format data summary
#   data_text <- paste(names(data_summary), ":", data_summary, collapse = "\n")

#   # Base prompt by analysis type and language
#   if (language == "Hungarian") {
#     base_prompts <- list(
#       summary = "Készíts rövid összefoglalót az alábbi kérdőív adatokról:",
#       insights = "Elemezd az alábbi kérdőív adatokat és adj meg kulcsfontosságú felismeréseket:",
#       recommendations = "Az alábbi kérdőív eredmények alapján adj konkrét ajánlásokat:",
#       detailed = "Készíts részletes elemzést az alábbi kérdőív adatokról:"
#     )
#   } else {
#     base_prompts <- list(
#       summary = "Provide a brief summary of the following survey data:",
#       insights = "Analyze the following survey data and provide key insights:",
#       recommendations = "Based on the following survey results, provide specific recommendations:",
#       detailed = "Provide a detailed analysis of the following survey data:"
#     )
#   }

#   prompt_parts <- c(
#     base_prompts[[analysis_type]],
#     "",
#     "DATA:",
#     data_text,
#     ""
#   )

#   if (!is.null(custom_prompt)) {
#     prompt_parts <- c(prompt_parts, "ADDITIONAL INSTRUCTIONS:", custom_prompt, "")
#   }

#   return(paste(prompt_parts, collapse = "\n"))
# }

# .set_ellmer_timeout <- function() {
#   custom_function <- function(provider, req) {
#     req |>
#       httr2::req_timeout(900) |>
#       httr2::req_perform() |>
#       httr2::resp_body_json()
#   }

#   tryCatch(
#     {
#       unlockBinding("chat_perform_value", asNamespace("ellmer"))
#       assign("chat_perform_value", custom_function, envir = asNamespace("ellmer"))
#       lockBinding("chat_perform_value", asNamespace("ellmer"))
#     },
#     error = function(e) {
#       warning("Could not set custom timeout for ellmer")
#     }
#   )
# }

# # Utility operator for NULL coalescing
# `%||%` <- function(x, y) if (is.null(x)) y else x
