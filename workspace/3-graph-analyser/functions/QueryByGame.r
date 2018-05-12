QueryByGame = function(g, game){
  # get neighbor features
  neighbors.features       = adjacent_vertices(g, game)[[1]]
  neighbors.features.types = neighbors.features$Type
  neighbors.features.table = table(neighbors.features.types)

  # get neighbor games using neighbor features
  neighbors.features.games = adjacent_vertices(g, neighbors.features)

  # transform neighbors games and features into a dataframe
  neighbors.df = lapply(1:length(neighbors.features.games),
    function(index){
      data.frame(
        Game         = neighbors.features.games[[index]]$name,
        FeatureType  = neighbors.features.types[index],
        stringsAsFactors = FALSE
      )
    }
  )
  neighbors.df = rbindlist(neighbors.df)

  # calculate connections count and intersection
  neighbors.df = neighbors.df[, .(FreqIntersection = .N / neighbors.features.table[FeatureType]), by=.(Game,FeatureType)]

  # calculate total connections count and intersection
  neighbors.df = neighbors.df[, .(FreqIntersectionTotal = sum(FreqIntersection)), by=.(Game)]

  # get games games according with best intersection
  similar.games.ids = neighbors.df[order(FreqIntersectionTotal, decreasing = TRUE), Game, ]

  # extract games
  V(g)[similar.games.ids]
}
