# ==============================================================================
# Locations to be identified
# ==============================================================================
GetLocations <- function() {
  values <- c()

  # Historical Real Locations Cities
  values <- c(
    values,
    "Alexandria",
    "Athens",
    "Paris",
    "Rome",
    "Sparta",
    "Venice"
  )

  # Historical Real Locations Countries
  values <- c(
    values,
    "Greece",
    "Italy"
  )

  # Mythological
  values <- c(
    values,
    "Asgard",
    "Atlantis",
    "Camelot",
    "El Dorado",
    "Elysian Fields",
    "Lemuria",
    "Shambala",
    "Valhalla"
  )

  # Sightseeing
  values <- c(
    values,
    "Alcatraz",
    "Colosseum",
    "Eiffel Tower",
    "Stonehenge"
  )

  # Generic Locations
  values <- c(
    values,
    "Abandoned City",
    "Airport",
    "Amusement Park",
    "Asylum",
    "Beach",
    "Bridge",
    "Casino",
    "Castle",
    "Cavern", "cavern", "cave",
    "Church",
    "Circuit",
    "Citadel",
    "City",
    "Coast", "coastline", "seashore",
    "College / School", "college", "school", "academy",
    "Construction Site",
    "Courtyard",
    "Desert",
    "Dungeon",
    "Empire",
    "Factory",
    "Farm",
    "Forest",
    "Fortress",
    "Ghost Town",
    "Harbor",
    "Heaven",
    "High School",
    "Highway",
    "Hospital",
    "Hotel",
    "Island",
    "Jungle",
    "Junkyard",
    "Kingdom",
    "Laboratory", "laboratory", "lab",
    "Mansion",
    "Mars",
    "Maze",
    "Milky Way",
    "Mine",
    "Moon",
    "Mountain", "mountain", "mount",
    "Nightclub",
    "Ocean", "ocean", "sea",
    "Other Planet / Distant World", "planet", "other planet", "distant world",
    "Outer Space",
    "Parallel Universe",
    "Plains",
    "Police Station",
    "Prison",
    "Purgatory",
    "Pyramid",
    "Railway",
    "River",
    "Road",
    "Rooftop",
    "Ruins",
    "Sewer",
    "Slum / Favela", "slum", "favela",
    "Snow",
    "Space Station",
    "Stadium",
    "Subway",
    "Temple", "temple", "chapel", "cathedral", "shrine",
    "Tomb",
    "Tower",
    "Underwater",
    "Valley",
    "Venus",
    "Village / Town", "village", "town",
    "Wasteland",
    "Zoo"
  )

  return(values)
}
