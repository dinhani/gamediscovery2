# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/RenameGenre.r", encoding = "UTF-8")
source("functions/RenamePlatform.r", encoding = "UTF-8")
source("functions/RenameRating.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../2.1-dataframe-joiner/data/games.rds")
games$Attributes <- as.data.table(games$Attributes)

# ==============================================================================
# Rename VALUES
# ==============================================================================
games$Attributes[Type == "Genre", Value := RenameGenre(Value), ]
games$Attributes[Type == "Platform", Value := RenamePlatform(Value), ]
games$Attributes[Type == "Rating", Value := RenameRating(Value), ]

games$Attributes <- unique(games$Attributes)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
