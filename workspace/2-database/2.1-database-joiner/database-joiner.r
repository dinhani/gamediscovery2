# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/MergeColumns.r", encoding="UTF-8")

# ==============================================================================
# READ GAME INFO
# ==============================================================================
games.wikidata  = readRDS("../../1-datasource/1.1-wikidata/1.1.2-parser/data/games.rds")
games.mobygames = readRDS("../../1-datasource/1.2-mobygames/1.2.2-parser/data/games.rds")

# ==============================================================================
# JOIN GAME INFO
# ==============================================================================
games = games.wikidata %>%
  left_join(games.mobygames, by=c("WD_GameID" = "MB_GameID")) %>%
  transmute(
    ID       = WD_GameID,
    Name     = WD_GameLabel,
    Platform = MergeColumns(WD_PlatformLabel, MB_Platform),
    Genre    = MergeColumns(WD_GenreLabel,    MB_Genre)
  )

# ==============================================================================
# SAVE GAME INFO
# ==============================================================================
saveRDS(games, file = "data/games.rds")
