# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../../libraries.r", encoding = "UTF-8")

cl = makeCluster(7)
clusterEvalQ(cl, library(httr))
registerDoParallel(cl)

# ==============================================================================
# READ GAMES
# ==============================================================================
games = readRDS("../../1.1-wikidata/1.1.2-parser/data/games.rds")

# ==============================================================================
# DOWNLOAD GAMES
# ==============================================================================
foreach(game.id.wikidata = games$WD_GameID, game.id.mobygames=games$WD_MobyGamesLabel) %dopar% {
  # do not download if without id
  if(game.id.mobygames == ""){
    next
  }

  # do not download if exists
  game.filename = paste0("data/", game.id.wikidata, ".html")
  if(file.exists(game.filename)){
    next
  }

  # download
  game.url = paste0("http://www.mobygames.com/game/", game.id.mobygames[1])
  print(game.url)
  GET(game.url, write_disk(game.filename))
}
