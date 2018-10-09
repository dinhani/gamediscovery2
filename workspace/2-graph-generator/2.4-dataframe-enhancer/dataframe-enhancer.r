# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetAtmospheres.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetCharacters.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetCreatures.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetLocations.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetMechanics.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetOrganizations.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetPeriods.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetSoundtracks.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetVehicles.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/GetWeapons.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/IdentifyValues.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/SetWeightCalculated.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/SetWeightType.r", encoding = "UTF-8")
source("2-graph-generator/2.4-dataframe-enhancer/functions/SetYear.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("2-graph-generator//2.3-dataframe-renamer/data/games.rds")
games$Attributes <- as.data.table(games$Attributes)
games$Texts <- as.data.table(games$Texts)

# ==============================================================================
# ADD WEIGHT COLUMNS
# ==============================================================================
games$Attributes$WeightType <- 0
games$Attributes$WeightModifier <- 1

# ==============================================================================
# ENHANCE VALUES
# ==============================================================================
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Atmosphere", GetAtmospheres()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Character", GetCharacters()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Creature", GetCreatures()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Mechanic", GetMechanics()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Organization", GetOrganizations()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Setting", GetLocations()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Setting", GetPeriods()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Soundtrack", GetSoundstracks()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Vehicle", GetVehicles()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Weapon", GetWeapons()) %>% rbind(games$Attributes)

games$Attributes <- SetYear(games$Attributes)
games$Attributes <- SetWeightType(games$Attributes)
games$Attributes <- SetWeightCalculated(games$Attributes)

games$Attributes <- unique(games$Attributes, by = c("Name", "Type", "Value"))

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "2-graph-generator/2.4-dataframe-enhancer/data/games.rds")
