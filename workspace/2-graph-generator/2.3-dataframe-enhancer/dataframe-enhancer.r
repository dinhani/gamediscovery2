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
games$Attributes <- as.data.table(games$Attributes)

# ==============================================================================
# ENHANCE VALUES
# ==============================================================================
games$Attributes <- AddCharacter(games$Attributes)
games$Attributes <- AddYear(games$Attributes)
games$Attributes <- AddWeight(games$Attributes)

games$Attributes <- unique(games$Attributes)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
