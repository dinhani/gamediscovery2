# ==============================================================================
# Save Wikidata datasets
# ==============================================================================
SaveWikidata <- function(data, filename) {
  # generate path to save file
  pathToSave <- paste0("1-datasource/1.1-wikidata/1.1.1-downloader/data/", filename, ".tsv")
  print(pathToSave)

  # save file
  fwrite(data, pathToSave, sep = "\t", quote = TRUE)
}
