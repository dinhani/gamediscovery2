# ==============================================================================
# Identity keywords in game texts and generate new rows for the found values
# ==============================================================================
IdentifyValues <- function(games.attributes, games.tdm, type, values) {
  # identify values in game text
  map_dfr(values, function(value){
    # log
    print(value)

    # find documents where value appear
    games.scores <- tm_term_score(games.tdm, tolower(value))
    games.scores <- games.scores[games.scores >= 2]
    games.rows   <- as.numeric(names(games.scores))

    # filter games by the scores found
    games.attributes[
      games.rows,
      .(ID, Name, Type = type, Value = value[[1]], Ocurrences = games.scores),
      ]
  })
}
