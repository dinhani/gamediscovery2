# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/AddCharacter.r", encoding = "UTF-8")
source("functions/AddWeight.r", encoding = "UTF-8")
source("functions/AddYear.r", encoding = "UTF-8")
source("functions/GenerateRowsMatchingGameName.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../2.2-dataframe-renamer/data/games.rds")
games <- as.data.table(games)

# ==============================================================================
# ENHANCE VALUES
# ==============================================================================
games <- AddCharacter(games)
games <- AddYear(games)
games <- AddWeight(games)

games <- unique(games)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
