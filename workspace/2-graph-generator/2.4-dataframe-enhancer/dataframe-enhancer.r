# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/IdentifyValues.r", encoding = "UTF-8")
source("functions/IdentifyCharacter.r", encoding = "UTF-8")
source("functions/IdentifyMechanic.r", encoding = "UTF-8")
source("functions/SetYear.r", encoding = "UTF-8")
source("functions/SetWeight.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../2.3-dataframe-renamer/data/games.rds")
games$Attributes <- as.data.table(games$Attributes)

# ==============================================================================
# ENHANCE VALUES
# ==============================================================================
games$Attributes <- rbind(games$Attributes, IdentifyCharacter(games$Texts, games$TDM))
games$Attributes <- rbind(games$Attributes, IdentifyMechanic(games$Texts, games$TDM))
games$Attributes <- SetYear(games$Attributes)
games$Attributes <- SetWeight(games$Attributes)

games$Attributes <- unique(games$Attributes)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
