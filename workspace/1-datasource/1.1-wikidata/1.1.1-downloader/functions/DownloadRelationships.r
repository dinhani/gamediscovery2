# ==============================================================================
# Download relationships between a base entity type and a related entity type
# ==============================================================================
DownloadRelationships <- function(entityPrefix, entityCondition, additionalEntityPrefix = "", additionalEntityCondition = "", entityLink = FALSE) {
  # generate filename
  filename <- entityPrefix
  if (additionalEntityPrefix != "") {
    filename <- paste0(filename, "-", additionalEntityPrefix)
  }

  # download and save
  future({
    QueryWikidata(entityPrefix, entityCondition, additionalEntityPrefix, additionalEntityCondition, entityLink) %>%
      SaveWikidata(filename)
  })
}
