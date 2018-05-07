# ==============================================================================
# Download associates relationships of games (Q7889)
# ==============================================================================
DownloadRelationshipsOfGames = function(additionalEntityPrefix = "", additionalEntityCondition = "", entityLink = FALSE){
  DownloadRelationships("Game", "wdt:P31 wd:Q7889", additionalEntityPrefix, additionalEntityCondition, entityLink)
}
