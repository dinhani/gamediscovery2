# ==============================================================================
# LIBRARIES
# ==============================================================================
library(dplyr)

# ==============================================================================
# READ GAME INFO
# ==============================================================================
games.wikidata  = readRDS("../../1-datasource/1.1-wikidata/data/parsed/games.rds")
games.mobygames = readRDS("../../1-datasource/1.2-mobygames/data/parsed/games.rds")

games = games.wikidata %>%
  inner_join(games.mobygames, by=c("WD_GameID" = "MG_GameID")) %>%
  select(WD_GameLabel, WD_PlatformLabel, MG_Platform) %>%
  arrange(WD_GameLabel) %>%
  na_if("NULL")

