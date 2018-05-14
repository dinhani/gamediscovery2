# ==============================================================================
# Identify game mechanics of the existing games
# ==============================================================================
IdentifyMechanic <- function(games.texts, games.tdm) {
  # MECHANICS
  mechanics = c("bullet-time", "squad")

  # IDENTIFY
  IdentifyValues(games.texts, games.tdm, "Mechanics", mechanics)
}
