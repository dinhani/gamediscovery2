# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
list.files("1-datasource/1.1-wikidata/1.1.2-parser/functions/", full.names = TRUE) %>% walk(source, encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games.base <- fread("1-datasource/1.1-wikidata/1.1.1-downloader/data/Game.tsv") %>%
  mutate(
    GameID = ParseWikidataID(GameID),
    GameLabel = ParseWikidataLabel(GameLabel),
    GameLink = ParseWikidataLink(GameLink)
  )

# ==============================================================================
# READ GAMES RELATIONSHIPS
# ==============================================================================
games.relationships.files <- list.files("1-datasource/1.1-wikidata/1.1.1-downloader/data/", pattern = "Game-", full.names = TRUE)
games.relationships <- map(games.relationships.files, ParseWikidataRelationshipFile)

# ==============================================================================
# JOIN GAMES AND RELATIONSHIPS
# ==============================================================================
games <- append(games.relationships, list(games.base), 0) %>%
  reduce(left_join, by = "GameID") %>%
  set_names(paste0("WD_", colnames(.)))

# ==============================================================================
# SAVES GAMES
# ==============================================================================
saveRDS(games, file = "1-datasource/1.1-wikidata/1.1.2-parser/data/games.rds")
