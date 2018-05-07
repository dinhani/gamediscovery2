# ==============================================================================
# LIBRARIES
# ==============================================================================
library(data.table)
library(dplyr)
library(purrr)
library(stringr)

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/ParseEntityID.r",            encoding="UTF-8")
source("functions/ParseEntityLabel.r",         encoding="UTF-8")
source("functions/ParseEntityLink.r",          encoding="UTF-8")

source("functions/ReadGameRelationships.r",  encoding="UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games = fread("../data/raw/Game.tsv") %>%
  mutate(
    GameID    = ParseEntityID(GameID),
    GameLabel = ParseEntityLabel(GameLabel),
    GameLink  = ParseEntityLink(GameLink)
  )

# ==============================================================================
# READ GAMES RELATIONSHIPS
# ==============================================================================
games.relationships.files = list.files("../data/raw", pattern = "Game-", full.names = TRUE)
games.relationships = lapply(games.relationships.files, ReadGameRelationships)

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
