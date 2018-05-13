# ==============================================================================
# Set the weight of each type to be used in the recommendations
# ==============================================================================
SetWeight <- function(games.attributes) {
  NONE        <- 0
  MEDIUM      <- 1
  MEDIUM_HIGH <- 2
  HIGH        <- 4
  HIGHEST     <- 8

  games.attributes[
    ,
    Weight := recode(Type,
      # HIGHEST
      "Genre"     = HIGHEST,
      "Setting"   = HIGHEST,
      "Mechanic"  = HIGHEST,

      # HIGH
      "Graphics"  = HIGH,
      "Characte"  = HIGH,
      "Sport"     = HIGH,
      "Vehicle"   = HIGH,

      # MEDIUM HIGH
      "Rating"    = MEDIUM_HIGH,

      # MEDIUM
      "Developer" = MEDIUM,
      "Person"    = MEDIUM,

      # NONE
      .default = NONE
    ),
  ][]
}
