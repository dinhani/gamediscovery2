EnhanceWeight = function(v){

  LOW         = 1
  MEDIUM      = 2
  MEDIUM_HIGH = 3
  HIGH        = 4
  HIGHEST     = 5

  recode(v,
    # INDUSTRY
    "Developer"     = HIGH,
    "Person"        = MEDIUM_HIGH,
    "Publisher"     = MEDIUM,
    "Platform"      = MEDIUM_HIGH,
    "RatingFeature" = MEDIUM_HIGH,
    "RatingESRB"    = MEDIUM,
    "RatingPEGI"    = MEDIUM,
    "Series"        = HIGHEST,
    "Year"          = LOW,

    # GAMEPLAY
    "Duration"      = LOW,
    "Engine"        = MEDIUM,
    "GameMode"      = MEDIUM,
    "Genre"         = HIGHEST,
    "Graphics"      = HIGH,
    "Mechanics"     = HIGH,

    # PLOT
    "Atmosphere"    = MEDIUM_HIGH,
    "Character"     = HIGHEST,
    "Creature"      = HIGH,
    "Location"      = MEDIUM_HIGH,
    "Organization"  = MEDIUM_HIGH,
    "Period"        = MEDIUM_HIGH,
    "Soundtrack"    = MEDIUM,
    "Setting"       = HIGH, # remove
    "SportTeam"     = MEDIUM_HIGH,
    "Theme"         = HIGH,
    "Vehicle"       = MEDIUM_HIGH,
    "Weapon"        = MEDIUM_HIGH
  )
}
