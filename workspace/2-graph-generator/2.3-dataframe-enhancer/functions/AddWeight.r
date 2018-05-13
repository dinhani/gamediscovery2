AddWeight <- function(games) {
  NONE        <- 0
  MEDIUM      <- 1
  MEDIUM_HIGH <- 2
  HIGH        <- 4
  HIGHEST     <- 8

  games[
    ,
    Weight := recode(Type,
      # HIGHEST
      "Genre"     = HIGHEST,
      "Setting"   = HIGHEST,
      "Mechanics" = HIGHEST,

      # HIGH
      "Graphics"  = HIGH,
      "Character" = HIGH,
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
