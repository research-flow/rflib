# {{header_comment}}
# Generated on: {{generation_date}}

library(RODBC)

run_eles <- F
# Gyökérkönyvtár beállítása
# ---------------------------------------------
setwd("XXX")

# Adatbazis kapcsolat felepitese
# ---------------------------------------------
channel <- RODBC::odbcDriverConnect(
  connection = "DSN=XXX;uid=XXX;pwd=XXX"
)

# Teszt futtatás ---------------------------------------------
if (!run_eles) {
  schema <- "{{schema}}"
  
  Sys.setenv(TZ = "CET")
  Sys.setenv(NLS_LANG = "HUNGARIAN_HUNGARY.AL32UTF8")
  Sys.setenv(ORA_SDTZ = "CET")
  
  channel <- RODBC::odbcConnect(
    dsn = "{{test_dsn}}",
    uid = schema,
    pwd = Sys.getenv(paste0("OCI_", schema, "_PW")),
    DBMSencoding = "UTF-8"
  )
}

# Log file setup ---------------------------------------------
folder <- paste0("OUT_", gsub("-", "", Sys.Date()))

if (!dir.exists(folder)) {
  dir.create(folder)
}

log_file <- paste0(folder, "/script_log.txt")
log_message <- function(message) {
  timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
  log_entry <- paste0("[", timestamp, "] ", message, "\n")
  cat(log_entry, file = log_file, append = TRUE)
}

time <- format(Sys.time(), "%Y%m%d_%H%M%S")

# == Auto-generated source statements start ===================================
message("\nLoading R scripts from: {{source_folder}}")
{{#r_files}}
source("{{{.}}}")
{{/r_files}}
# == Auto-generated source statements end =====================================

# List all files in the output folder ---------------------------------------------
output_files <- list.files(folder, full.names = TRUE)
log_message("Listing all files created:")
log_message(paste(output_files, collapse = "\n"))

odbcClose(channel)
log_message("Database connection closed. Script execution completed.")
