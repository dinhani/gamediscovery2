# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("1-datasource/1.2-mobygames/1.2.2-parser/functions/ParseMobyGamesHTMLFile.r", encoding = "UTF-8")

# ==============================================================================
# READ FILES
# ==============================================================================
games.files <- list.files("1-datasource/1.2-mobygames/1.2.1-downloader/data/", pattern = "*.html", full.names = TRUE)

# ==============================================================================
# PARSE FILES
# ==============================================================================
games <- future_map_dfr(games.files, ParseMobyGamesHTMLFile, .progress = TRUE) %>%
  mutate(
    Platform = if_else(is.na(Platforms), Platform, Platforms)
  ) %>%
  set_names(paste0("MB_", colnames(.)))

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "1-datasource/1.2-mobygames/1.2.2-parser/data/games.rds")
