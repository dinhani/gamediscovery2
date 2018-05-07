# ==============================================================================
# Parse Wikidata entity link format
# ==============================================================================
ParseWikidataLink = function(links){
    links = gsub("<", "", links)
    links = gsub(">", "", links)
}
