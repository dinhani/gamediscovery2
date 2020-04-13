# ==============================================================================
# Parse Wikidata entity ID format
# ==============================================================================
ParseWikidataID <- function(ids) {
  ids <- str_extract(ids, "(?<=\\/Q).+$")
}
