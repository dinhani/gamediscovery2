# ==============================================================================
# LIBRARIES
# ==============================================================================
library(dplyr)
library(purrr)

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/MergeColumns.r", encoding="UTF-8")

# ==============================================================================
# READ GAME INFO
# ==============================================================================
games.wikidata  = readRDS("../../1-datasource/1.1-wikidata/data/parsed/games.rds")
games.mobygames = readRDS("../../1-datasource/1.2-mobygames/data/parsed/games.rds")

# ==============================================================================
# JOIN GAME INFO
# ==============================================================================
games = games.wikidata %>%
  left_join(games.mobygames, by=c("WD_GameID" = "MB_GameID")) %>%
  na_if("NULL") %>%
  transmute(
    ID       = WD_GameID,
    Name     = WD_GameLabel,
    Platform = MergeColumns(WD_PlatformLabel, MB_Platform),
    Genre    = MergeColumns(WD_GenreLabel,    MB_Genre)
  )
