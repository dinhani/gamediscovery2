# ==============================================================================
# Identity keywords in game names and texts and generate new rows for the found
# values
# ==============================================================================
IdentifyValues <- function(games.texts, games.tdm, type, values) {
  # identify values in game text
  lapply(values, function(value){
    # find documents where value appear
    games.scores <- tm_term_score(games.tdm, tolower(value))
    games.scores <- games.scores[games.scores >= 2]
    games.rows   <- as.numeric(names(games.scores))

    # filter games by the scores found
    games.texts[
      games.rows,
      .(ID, Name, Type = type, Value = value[[1]]),
      ]
  }) %>%
    rbindlist() %>%
    unique()
}
