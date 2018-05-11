# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/RecodeESRB.r", encoding = "UTF-8")
source("functions/RecodeGenre.r", encoding = "UTF-8")
source("functions/RecodePlatform.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games = readRDS("../2.1-dataframe-joiner/data/games.rds")
games = as.data.table(games)

# ==============================================================================
# RECODE VALUES
# ==============================================================================
t1 = Sys.time()

games[Type == "ESRB",     Value := RecodeESRB(Value),]
games[Type == "Genre",    Value := RecodeGenre(Value),]
games[Type == "Platform", Value := RecodePlatform(Value),]
games = unique(games)

Sys.time() - t1

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")

games %>%
  filter(Type == "ESRB") %>%
  group_by(Value) %>%
  summarise(
    N = n()
  ) %>%
  arrange(desc(N)) %>%
  View
