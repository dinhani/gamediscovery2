# ==============================================================================
# Identity keywords in game names and texts and generate new rows for the found
# values
# ==============================================================================
IdentifyValues <- function(games.texts, type, values) {
  games.texts = as.data.table(games.texts)

  # identify values in game title
  identified.bytitle <- lapply(values, function(value) {
    games.texts[
      str_detect(games.texts$Name, value),
      .(ID, Name, Type = type, Value = value),
    ]
  }) %>%
    rbindlist()

  # identify values in game text
  identified.bytext <- lapply(values, function(value){
    games.texts[
      str_detect(games.texts$Description, value),
      .(ID, Name, Type = type, Value = value),
    ]
  }) %>%
    rbindlist()

  # join identified values
  unique(rbind(identified.bytitle, identified.bytext))
}
