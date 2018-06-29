# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../../libraries.r", encoding = "UTF-8")

cl <- makeCluster(8)
clusterEvalQ(cl, library(httr))
registerDoParallel(cl)

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../../1.1-wikidata/1.1.2-parser/data/games.rds")

# ==============================================================================
# DOWNLOAD PAGES
# ==============================================================================
foreach(game.id = games$WD_GameID, game.url = games$WD_GameLink) %do% {
  # do not download if without link
  if (game.url == "") {
    next
  }

  # do not download if exists
  game.filename <- paste0("data/", game.id, ".html")
  if (file.exists(game.filename) & file.info(game.filename) > 2048) {
    next
  }

  # download
  print(game.url)
  GET(game.url, write_disk(game.filename, overwrite = TRUE))
}