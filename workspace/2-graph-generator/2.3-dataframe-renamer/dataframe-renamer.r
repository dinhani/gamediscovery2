# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
list.files("2-graph-generator/2.3-dataframe-renamer/functions/", full.names = TRUE) %>% walk(source, encoding = "UTF-8")

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
