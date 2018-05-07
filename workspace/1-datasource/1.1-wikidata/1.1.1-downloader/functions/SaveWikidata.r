# ==============================================================================
# Save Wikidata datasets
# ==============================================================================
SaveWikidata = function(data, filename){
    # generate path to save file
    pathToSave = paste0("../data/raw/", filename, ".tsv")
    print(pathToSave)

    # save file
    fwrite(data, pathToSave, sep="\t", quote=TRUE)
}
