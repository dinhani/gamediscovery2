# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/ParseWikidataRelationshipFile.r", encoding="UTF-8")

source("functions/ParseWikidataID.r",      encoding="UTF-8")
source("functions/ParseWikidataLabel.r",   encoding="UTF-8")
source("functions/ParseWikidataLink.r",    encoding="UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games.base = fread("../data/raw/Game.tsv") %>%
  mutate(
    GameID    = ParseWikidataID(GameID),
    GameLabel = ParseWikidataLabel(GameLabel),
    GameLink  = ParseWikidataLink(GameLink)
  )

# ==============================================================================
# READ GAMES RELATIONSHIPS
# ==============================================================================
games.relationships.files = list.files("../data/raw", pattern = "Game-", full.names = TRUE)
games.relationships = lapply(games.relationships.files, ParseWikidataRelationshipFile)

# ==============================================================================
# JOIN GAMES AND RELATIONSHIPS
# ==============================================================================
games = append(games.relationships, list(games.base), 0) %>%
  reduce(left_join, by="GameID")

# add column prefix
colnames(games) = paste0("WD_", colnames(games))

# ==============================================================================
# SAVES GAMES
# ==============================================================================
games %>% saveRDS("../data/parsed/games.rds")
