# Demo: Analyzing survey results with ChatGPT
library(rflib)

# Create sample survey data
sample_data <- data.frame(
  respondent_id = 1:100,
  answer = sample(c("Elégedett", "Közömbös", "Elégedetlen", "Nagyon elégedett"), 100, replace = TRUE),
  stringsAsFactors = FALSE
)

library(tidyverse)
Survey <- rflib::survey_init(path = "inst/extdata/173_MPC_250325_raw.xlsx", clean_text = TRUE)
Survey <- rflib::survey_add_definition(Survey, "inst/extdata/173_MPC_250325_kerdes_seged.xlsx")
sample_question <- Survey$questions[[1]]

# Example 1: Quick summary analysis
cat("=== Example 1: Quick Summary ===\n")
# Uncomment to run (requires API key):
summary_result <- survey_analyze_with_chatgpt(
  question = sample_question,
  plot_obj = get_ggplot(sample_question),
  analysis_type = "insights",
  language = "Hungarian"
)
cat(summary_result)

# Example 2: Get insights
cat("\n=== Example 2: Key Insights ===\n")
# insights_result <- survey_quick_insights(sample_question, language = "Hungarian")
# cat(insights_result)

# Example 3: Get recommendations
cat("\n=== Example 3: Recommendations ===\n")
# recommendations <- survey_get_recommendations(
#   sample_question,
#   context = "Customer satisfaction survey for a healthcare service",
#   language = "Hungarian"
# )
# cat(recommendations)

# Example 4: Analyze with plot
# sample_plot <- get_ggplot(sample_question)  # Assuming this works
# plot_analysis <- survey_analyze_with_chatgpt(
#   sample_question,
#   plot_obj = sample_plot,
#   analysis_type = "detailed",
#   custom_prompt = "Focus on the visual patterns and what they tell us about customer behavior"
# )

# Example 5: Direct data frame analysis
cat("\n=== Example 5: Direct Data Analysis ===\n")
# direct_analysis <- survey_analyze_with_chatgpt(
#   sample_data,
#   analysis_type = "insights",
#   custom_prompt = "What patterns do you see in this response distribution?"
# )

cat("\nTo run these examples, set your OpenAI API key:\n")
cat("Sys.setenv(OPENAI_API_KEY = 'your-api-key-here')\n")
