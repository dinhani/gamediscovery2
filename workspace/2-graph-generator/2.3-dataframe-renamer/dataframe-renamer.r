# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("2-graph-generator/2.3-dataframe-renamer/functions/RenameGenre.r", encoding = "UTF-8")
source("2-graph-generator/2.3-dataframe-renamer/functions/RenamePlatform.r", encoding = "UTF-8")
source("2-graph-generator/2.3-dataframe-renamer/functions/RenameRating.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("2-graph-generator/2.2-dataframe-text-processor/data/games.rds")
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
saveRDS(games, file = "2-graph-generator/2.3-dataframe-renamer/data/games.rds")
