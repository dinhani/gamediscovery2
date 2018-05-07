# ==============================================================================
# LIBRARIES
# ==============================================================================
library(data.table)
library(foreach)
library(httr)

# ==============================================================================
# READ GAMES
# ==============================================================================
games = readRDS("../../1.1-wikidata/data/parsed/games.rds")

# ==============================================================================
# DOWNLOAD GAMES
# ==============================================================================
foreach(game.id = games$GameID, game.mobygamesid=games$MobyGamesLabel) %do% {
  # do not download if without id
  if(game.mobygamesid == ""){
    next
  }
  
  # do not download if exists
  game.filename = paste0("../data/raw/", game.id, ".html")
  if(file.exists(game.filename)){
    next
  }
  
  # download
  game.url = paste0("http://www.mobygames.com/game/", game.mobygamesid[1])
  print(game.url)
  GET(game.url, write_disk(game.filename))
}
