# ==============================================================================
# Characters to be identified
# ==============================================================================
GetCharacters <- function() {
  values <- c()
  # Anime
  values <- c(values, "Gohan", "Goku", "Vegeta")
  # Disney
  values <- c(values, "Donald Duck", "Mickey", "Pinocchio")
  # Games
  values <- c(values, "Gordon Freeman", "Kratos", "Lara Croft", "Master Chief", "Pac Man", "Sonic", "Yoshi")
  # Gods
  values <- c(values, "Anubis", "Aphrodite", "Apollo", "Ares", "Artemis", "Athena", "Cronos", "Hades", "Helios", "Hercules", "Odin", "Osiris", "Poseidon", "Thor", "Xena", "Zeus")
  # Historical
  values <- c(values, "Archimedes", "Einstein",  "Hitler", "Julius Caesar", "Leonidas", "Socrates", "Tesla")
  # Marvel / DC
  values <- c(values, "Batman", "Captain America", "Catwoman", "Deadpool", "Hulk", "Iron Man", "Joker", "Robin", "Spider-Man", "Superman", "Thanos", "Venom", "Wolverine")

  return(values)
}
