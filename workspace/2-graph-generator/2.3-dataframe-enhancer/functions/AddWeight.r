AddWeight <- function(games) {
  LOW <- 1
  MEDIUM <- 2
  MEDIUM_HIGH <- 3
  HIGH <- 4
  HIGHEST <- 5

  games[
    ,
    Weight := recode(Type,
      # INDUSTRY
      "Developer" = HIGH,
      "Person" = MEDIUM_HIGH,
      "Platform" = MEDIUM_HIGH,
      "Publisher" = MEDIUM,
      "RatingESRB" = MEDIUM,
      "RatingPEGI" = MEDIUM,
      "RatingFeature" = MEDIUM_HIGH,
      "Series" = HIGHEST,
      "Year" = LOW,

      # GAMEPLAY
      "Duration" = LOW,
      "Engine" = MEDIUM,
      "GameMode" = MEDIUM,
      "Genre" = HIGHEST,
      "Graphics" = HIGH,
      "Mechanics" = HIGH,

      # PLOT
      "Atmosphere" = MEDIUM_HIGH,
      "Character" = HIGHEST,
      "Creature" = HIGH,
      "Location" = MEDIUM_HIGH,
      "Organization" = MEDIUM_HIGH,
      "Period" = MEDIUM_HIGH,
      "Soundtrack" = MEDIUM,
      "SportTeam" = MEDIUM_HIGH,
      "Theme" = HIGH,
      "Vehicle" = MEDIUM_HIGH,
      "Weapon" = MEDIUM_HIGH
    ),
  ][]
}
