# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../index.r", encoding = "UTF-8")

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
games = fread("../data/raw/Game.tsv") %>%
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
games.joined = append(games.relationships, list(games), 0) %>%
  reduce(left_join, by="GameID") %>%
  na_if("NULL")

# ==============================================================================
# SAVES GAMES
# ==============================================================================
games.joined %>% saveRDS("../data/parsed/games.rds")
