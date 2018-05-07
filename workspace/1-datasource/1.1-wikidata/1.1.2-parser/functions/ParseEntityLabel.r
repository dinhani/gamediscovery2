# ==============================================================================
# Parse Wikidata entity label format
# ==============================================================================
ParseEntityLabel = function(labels){
    labels = gsub("@en", "", labels)
    labels = gsub("\"", "", labels)
}
