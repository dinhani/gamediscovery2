# ==============================================================================
# Set the final weight calculated using type and modifier
# ==============================================================================
SetWeightCalculated <- function(games.attributes) {
  games.attributes$Weight <- games.attributes$WeightType * games.attributes$WeightModifier
  games.attributes
}
