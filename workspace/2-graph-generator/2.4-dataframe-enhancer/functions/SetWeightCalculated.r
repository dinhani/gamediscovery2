# ==============================================================================
# Set the final weight calculated using type and modifier
# ==============================================================================
SetWeightCalculated <- function(games.attributes) {
  games.attributes[
    ,
    .(
      ID,
      Name,
      Type,
      Value,
      Weight = WeightType * WeightModifier
    )
    ,
  ][]
}
