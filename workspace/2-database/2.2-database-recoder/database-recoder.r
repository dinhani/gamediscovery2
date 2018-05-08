# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/Recode.r", encoding = "UTF-8")
source("functions/RecodeGenre.r", encoding = "UTF-8")
source("functions/RecodePlatform.r", encoding = "UTF-8")

# ==============================================================================
# READ GAME INFO
# ==============================================================================
games = readRDS("../../2-database/2.1-database-joiner/data/games.rds")

# ==============================================================================
# RECODE VALUES
# ==============================================================================
games.recoded = games %>%
  mutate(
    Genre    = sapply(Genre, FUN=RecodeGenre),
    Platform = sapply(Genre, FUN=RecodePlatform)
  )

# ==============================================================================
# SAVE GAME INFO
# ==============================================================================
saveRDS(games.recoded, file = "data/games.rds")
