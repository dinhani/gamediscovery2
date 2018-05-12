# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/RecodeGenre.r", encoding = "UTF-8")
source("functions/RecodePlatform.r", encoding = "UTF-8")
source("functions/RecodeRatingESRB.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games = readRDS("../2.1-dataframe-joiner/data/games.rds")
games = as.data.table(games)

# ==============================================================================
# RECODE VALUES
# ==============================================================================
games[Type == "Genre",      Value := RecodeGenre(Value),      ]
games[Type == "Platform",   Value := RecodePlatform(Value),   ]
games[Type == "RatingESRB", Value := RecodeRatingESRB(Value), ]
games = unique(games)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")

games %>%
  filter(Type == "Setting") %>%
  group_by(Value) %>%
  summarise(
    N = n()
  ) %>%
  arrange(desc(N)) %>%
  View
