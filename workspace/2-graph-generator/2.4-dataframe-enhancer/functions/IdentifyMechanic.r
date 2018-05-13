# ==============================================================================
# Identify game mechanics of the existing games
# ==============================================================================
IdentifyMechanic <- function(games.texts) {
  # MECHANICS
  mechanics = c("bullet-time", "squad")

  # IDENTIFY
  IdentifyValues(games.texts, "Mechanics", mechanics)
}
