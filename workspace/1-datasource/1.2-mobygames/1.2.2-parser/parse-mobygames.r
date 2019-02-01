# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
list.files("1-datasource/1.2-mobygames/1.2.2-parser/functions/", full.names = TRUE) %>%
  walk(source, encoding = "UTF-8")

# ==============================================================================
# READ FILES
# ==============================================================================
games.files <- list.files("1-datasource/1.2-mobygames/1.2.1-downloader/data/", pattern = "*.html", full.names = TRUE)
games.files2 <- head(games.files, 1000)

# ==============================================================================
# PARSE FILES
# ==============================================================================
plan(multiprocess, workers = 7)

games <- future_map_dfr(games.files, ParseMobyGamesHTMLFile, .progress = TRUE)
games$Platform <- ifelse(is.na(games$Platforms), games$Platform, games$Platforms)
colnames(games) <- paste0("MB_", colnames(games))

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "1-datasource/1.2-mobygames/1.2.2-parser/data/games.rds")
