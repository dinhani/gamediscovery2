QueryByGame = function(g, game){
  # get neighbor features
  neighbor.features       = adjacent_vertices(g, game)[[1]]
  neighbor.features.types = neighbor.features$Type
  neighbor.features.table = table(neighbor.features.types)

  # get neighbor games using neighbor features
  neighbor.features.games = adjacent_vertices(g, neighbor.features)

  # transform neighbors games and features into a dataframe
  neighbors.df = lapply(1:length(neighbor.features.games),
    function(index){
      data.frame(
        Game         = neighbor.features.games[[index]]$name,
        FeatureType  = neighbor.features.types[index],
        stringsAsFactors = FALSE
      )
    }
  )
  neighbors.df = rbindlist(neighbors.df)

  # calculate connections count and intersection
  neighbors.df = neighbors.df[
    , 
    .(FreqCount = .N, FreqIntersection = .N / neighbor.features.table[FeatureType]), 
    by=.(Game,FeatureType)
  ]

  # calculate total connections count and intersection
  neighbors.df = neighbors.df[
    ,
    .(FreqCountTotal = sum(FreqCount), FreqIntersectionTotal = sum(FreqIntersection)),
    by=.(Game)
  ]

  # get games games according with best intersection
  similar.games.ids = neighbors.df[order(FreqIntersectionTotal, decreasing = TRUE),Game,]

  # extract games
  V(g)[similar.games.ids]
}
