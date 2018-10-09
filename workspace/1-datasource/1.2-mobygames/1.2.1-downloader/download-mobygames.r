# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("1-datasource/1.1-wikidata/1.1.2-parser/data/games.rds")

# ==============================================================================
# DOWNLOAD GAMES
# ==============================================================================
future_walk2(games$WD_GameID, games$WD_MobyGamesLabel, .progress = TRUE, .f = safely(function(game.id.wikidata, game.id.mobygames) {
  # do not download if without id
  if (length(game.id.mobygames) == 0) {
    return(NULL)
  }

  # do not download if exists
  game.filename <- paste0("1-datasource/1.2-mobygames/1.2.1-downloader/data/", game.id.wikidata, ".html")
  if (file.exists(game.filename)) {
    return(NULL)
  }

  # download
  game.url <- paste0("http://www.mobygames.com/game/", game.id.mobygames[1])
  print(game.url)
  GET(game.url, write_disk(game.filename))
}))
