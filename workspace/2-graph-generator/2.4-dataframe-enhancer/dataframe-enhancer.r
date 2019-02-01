# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
list.files("2-graph-generator/2.4-dataframe-enhancer/functions/", full.names = TRUE) %>% walk(source, encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("2-graph-generator/2.3-dataframe-renamer/data/games.rds")
games$Attributes <- as.data.table(games$Attributes)

# ==============================================================================
# ADD OCURRENCES COLUMNS
# ==============================================================================
games$Attributes$Ocurrences <- 1

# ==============================================================================
# ENHANCE VALUES
# ==============================================================================
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Atmosphere", GetAtmospheres()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Character", GetCharacters()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Creature", GetCreatures()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Mechanic", GetMechanics()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Organization", GetOrganizations()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Setting", GetLocations()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Setting", GetPeriods()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Soundtrack", GetSoundstracks()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Vehicle", GetVehicles()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Attributes, games$TDM, "Weapon", GetWeapons()) %>% rbind(games$Attributes)
games$Attributes <- SetYear(games$Attributes)

games$Attributes <- unique(games$Attributes, by = c("ID", "Type", "Value"))

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "2-graph-generator/2.4-dataframe-enhancer/data/games.rds")
