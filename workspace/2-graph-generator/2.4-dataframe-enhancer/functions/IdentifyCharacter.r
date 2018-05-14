# ==============================================================================
# Identify characters of the existing games
# ==============================================================================
IdentifyCharacter <- function(games.texts, games.tdm) {
  # CHARACTERS
  characters <- c()
  characters <- c(characters, "Goku", "Vegeta")
  characters <- c(characters, "Batman", "Captain America", "Catwoman", "Deadpool", "Hulk", "Iron Man", "Joker", "Robin", "Spider-Man", "Superman", "Venom", "Wolverine")
  characters <- c(characters, "Hercules", "Thor", "Zeus")

  # IDENTIFY
  IdentifyValues(games.texts, games.tdm, "Character", characters)
}
