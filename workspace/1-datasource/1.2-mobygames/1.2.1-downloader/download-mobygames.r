# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../index.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games = readRDS("../../1.1-wikidata/data/parsed/games.rds")

# ==============================================================================
# DOWNLOAD GAMES
# ==============================================================================
foreach(game.id.wikidata = games$GameID, game.id.mobygames=games$MobyGamesLabel) %do% {
  # do not download if without id
  if(game.id.mobygames == ""){
    next
  }

  # do not download if exists
  game.filename = paste0("../data/raw/", game.id.wikidata, ".html")
  if(file.exists(game.filename)){
    next
  }

  # download
  game.url = paste0("http://www.mobygames.com/game/", game.id.mobygames[1])
  print(game.url)
  GET(game.url, write_disk(game.filename))
}
