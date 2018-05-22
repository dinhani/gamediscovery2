# ==============================================================================
# Characters to be identified
# ==============================================================================
GetCharacters <- function() {
  values <- list()

  # Anime
  values <- append(
    values,
    list(
      "Gohan",
      "Goku",
      "Vegeta"
    )
  )

  # Disney
  values <- append(
    values,
    list(
      "Donald Duck",
      "Mickey",
      "Pinocchio"
    )
  )

  # Games
  values <- append(
    values,
    list(
      "Gordon Freeman",
      "Kratos",
      "Lara Croft",
      "Master Chief",
      "Pac Man",
      "Sonic",
      "Yoshi"
    )
  )

  # Gods
  values <- append(
    values,
    list(
      "Anubis",
      "Aphrodite",
      "Apollo",
      "Ares",
      "Artemis",
      "Athena",
      "Cronos",
      "Hades",
      "Helios",
      "Hercules",
      "Odin",
      "Osiris",
      "Poseidon",
      "Thor",
      "Xena",
      "Zeus"
    )
  )

  # Historical
  values <- append(
    values,
    list(
      "Archimedes",
      "Einstein",
      "Hitler",
      "Julius Caesar",
      "Leonidas",
      "Socrates",
      "Tesla"
    )
  )

  # Marvel / DC
  values <- append(
    values,
    list(
      "Batman",
      "Captain America",
      "Catwoman",
      "Deadpool",
      list("Hulk", "incredible hulk"),
      "Iron Man",
      "Joker",
      "Robin",
      list("Spider-Man", "spiderman", "spider man"),
      "Superman",
      "Thanos",
      "Venom",
      "Wolverine"
    )
  )

  return(values)
}
