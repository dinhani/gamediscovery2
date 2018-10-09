# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("1-datasource//1.1-wikidata/1.1.2-parser/data/games.rds")

# ==============================================================================
# DOWNLOAD PAGES
# ==============================================================================
future_walk2(games$WD_GameID, games$WD_GameLink, .progress = TRUE, .f = function(game.id, game.url) {
  # do not download if without link
  if (length(game.url) == 0) {
    next
  }

  # do not download if exists
  game.filename <- paste0("1-datasource/1.3-wikipedia/1.3.1-downloader/data/", game.id, ".html")
  if (file.exists(game.filename)) {
    next
  }

  # download
  print(game.url)
  GET(game.url, write_disk(game.filename, overwrite = TRUE))
})
