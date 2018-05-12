# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/RenameGenre.r", encoding = "UTF-8")
source("functions/RenamePlatform.r", encoding = "UTF-8")
source("functions/RenameRatingESRB.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games = readRDS("../2.1-dataframe-joiner/data/games.rds")
games = as.data.table(games)

# ==============================================================================
# Rename VALUES
# ==============================================================================
games[Type == "Genre",      Value := RenameGenre(Value),      ]
games[Type == "Platform",   Value := RenamePlatform(Value),   ]
games[Type == "RatingESRB", Value := RenameRatingESRB(Value), ]
games = unique(games)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
