# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("2-graph-generator/2.4-dataframe-enhancer/data/games.rds")

# ==============================================================================
# DISCARD VALUES
# ==============================================================================
games$Attributes <- games$Attributes %>%
  group_by(Type, Value) %>%
  mutate(
    Remove = Type %in% c("GameMode", "Genre", "Platform") && n() < 30
  ) %>%
  filter(Remove == FALSE) %>%
  select(ID, Name, Type, Value, Ocurrences) %>%
  ungroup() %>%
  distinct()

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "2-graph-generator/2.5-dataframe-discarder/data/games.rds")
