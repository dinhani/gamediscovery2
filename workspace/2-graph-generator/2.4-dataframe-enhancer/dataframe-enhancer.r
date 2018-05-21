# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/IdentifyValues.r", encoding = "UTF-8")
source("functions/GetCharacters.r", encoding = "UTF-8")
source("functions/GetCreatures.r", encoding = "UTF-8")
source("functions/GetMechanics.r", encoding = "UTF-8")
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
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Character", GetCharacters()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Creature",  GetCreatures())  %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Mechanic",  GetMechanics())  %>% rbind(games$Attributes)
games$Attributes <- SetYear(games$Attributes)
games$Attributes <- SetWeight(games$Attributes)

games$Attributes <- unique(games$Attributes)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
