# ==============================================================================
# Parse Wikidata entity label format
# ==============================================================================
ParseWikidataLabel = function(labels){
    labels = gsub("@en", "", labels)
    labels = gsub("\"", "", labels)
}
