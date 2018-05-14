# ==============================================================================
# Identify characters of the existing games
# ==============================================================================
IdentifyCharacter <- function(games.texts, games.tdm) {
  characters <- c()
  # Anime
  characters <- c(characters, "Gohan", "Goku", "Vegeta")
  # Disney
  characters <- c(characters, "Donald Duck", "Mickey", "Pinocchio")
  # Games
  characters <- c(characters, "Gordon Freeman", "Kratos", "Lara Croft", "Master Chief", "Pac Man", "Sonic", "Yoshi")
  # Gods
  characters <- c(characters, "Anubis", "Aphrodite", "Apollo", "Ares", "Artemis", "Athena", "Cronos", "Hades", "Helios", "Hercules", "Odin", "Osiris", "Poseidon", "Thor", "Xena", "Zeus")
  # Historical
  characters <- c(characters, "Archimedes", "Einstein",  "Hitler", "Julius Caesar", "Leonidas", "Socrates", "Tesla")
  # Marvel / DC
  characters <- c(characters, "Batman", "Captain America", "Catwoman", "Deadpool", "Hulk", "Iron Man", "Joker", "Robin", "Spider-Man", "Superman", "Thanos", "Venom", "Wolverine")

  # IDENTIFY
  IdentifyValues(games.texts, games.tdm, "Character", characters)
}
