GenerateRowsMatchingGameName = function(games, type, values){
  # games basic info to filter quickly
  games.to.filter = unique(games[, .(ID, Name), ])

  # for each value, find games that matches the value and generate rows with the giving type and value
  lapply(values, function(value){
      games.to.filter[
          str_detect(games.to.filter$Name, value),
          .(ID, Name, Type = type, Value = value),
      ]
  }) %>%
  rbindlist()
}
