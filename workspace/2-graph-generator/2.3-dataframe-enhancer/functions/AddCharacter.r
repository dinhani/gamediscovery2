AddCharacter <- function(games) {
  # ============================================================================
  # CATEGORIES TO FIND
  # ============================================================================
  characters <- c()

  # Dragon Ball
  characters <- c(characters, "Goku", "Vegeta")

  # Marvel / DC
  characters <- c(characters, "Batman", "Captain America", "Catwoman", "Deadpool", "Hulk", "Iron Man", "Joker", "Robin", "Spider-Man", "Superman", "Venom", "Wolverine")

  # Gods
  characters <- c(characters, "Hercules", "Thor", "Zeus")

  # ============================================================================
  # FIND CHARACTERS
  # ============================================================================
  characters.rows <- GenerateRowsMatchingGameName(games, "Character", characters)
  rbind(games, characters.rows)
}
