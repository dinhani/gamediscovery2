# ==============================================================================
# Parse Wikidata entity link format
# ==============================================================================
ParseEntityLink = function(links){
    links = gsub("<", "", links)
    links = gsub(">", "", links)
}
