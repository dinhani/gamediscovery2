# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/GetAtmospheres.r", encoding = "UTF-8")
source("functions/GetCharacters.r", encoding = "UTF-8")
source("functions/GetCreatures.r", encoding = "UTF-8")
source("functions/GetLocations.r", encoding = "UTF-8")
source("functions/GetMechanics.r", encoding = "UTF-8")
source("functions/GetOrganizations.r", encoding = "UTF-8")
source("functions/GetPeriods.r", encoding = "UTF-8")
source("functions/GetSoundtracks.r", encoding = "UTF-8")
source("functions/GetVehicles.r", encoding = "UTF-8")
source("functions/GetWeapons.r", encoding = "UTF-8")
source("functions/IdentifyValues.r", encoding = "UTF-8")
source("functions/SetWeight.r", encoding = "UTF-8")
source("functions/SetYear.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../2.3-dataframe-renamer/data/games.rds")
games$Attributes <- as.data.table(games$Attributes)

# ==============================================================================
# ENHANCE VALUES
# ==============================================================================
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Atmosphere",   GetAtmospheres())   %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Character",    GetCharacters())    %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Creature",     GetCreatures())     %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Mechanic",     GetMechanics())     %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Organization", GetOrganizations()) %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Setting",      GetLocations())     %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Setting",      GetPeriods())       %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Soundtrack",   GetSoundstracks())  %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Vehicle",      GetVehicles())      %>% rbind(games$Attributes)
games$Attributes <- IdentifyValues(games$Texts, games$TDM, "Weapon",       GetWeapons())       %>% rbind(games$Attributes)
games$Attributes <- SetYear(games$Attributes)
games$Attributes <- SetWeight(games$Attributes)

games$Attributes <- unique(games$Attributes)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
