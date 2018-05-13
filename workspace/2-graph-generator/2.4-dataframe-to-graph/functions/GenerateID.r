# ==============================================================================
# Generate a unique ID for the game or property
# ==============================================================================
GenerateID <- function(type, id) {
  paste(type, id, sep = "-") %>%
    str_to_lower() %>%
    str_replace_all("\\s+", "-") %>%
    str_replace_all("[^a-z0-9-]", "")
}
