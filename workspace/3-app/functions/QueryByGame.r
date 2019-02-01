# ==============================================================================
# Query the game graph for games similar to the requested game
# ==============================================================================
QueryByGame <- function(g, g.es, game) {

  # get features connected to the searched game
  features.vertices <- adjacent_vertices(g, game)[[1]]
  features.vertices.types <- features.vertices$Type
  features.vertices.types.table <- table(features.vertices.types)

  # get edges between the features of the searched game and other games
  features.edges <- g.es[inc(features.vertices)]
  features.edges.feature <- head_of(g, features.edges)
  features.edges.game <- tail_of(g, features.edges)

  # generate a table of related games with their features
  games.df1 <- data.table(
    Game = features.edges.game,
    FeatureType = features.edges.feature$Type,
    Weight = RecodeWeight(features.edges.feature$Type)
  )

  # calculate weight intersection of features of related games with main game
  games.df2 <- games.df1[, .(FeatureCount = .N, Weight = mean(Weight)), by = .(Game, FeatureType)]
  games.df2$MainGameFeatureCount <- features.vertices.types.table[games.df2$FeatureType]
  games.df2$FeatureIntersection <- games.df2$FeatureCount / games.df2$MainGameFeatureCount
  games.df2$WeightIntersection <- games.df2$Weight * games.df2$FeatureIntersection
  games.df2 <- games.df2[WeightIntersection != 0,,]

  # calculate Weight of each game with main game using all the features
  games.df3 <- games.df2[,
    .(
      WeightIntersection = sum(WeightIntersection),
      Debug = list(paste0(FeatureType, " = ", round(FeatureIntersection,2)))
    ),
    by = .(Game)
  ]

  # get games games ordered by best weights
  games.df3[
    order(WeightIntersection, decreasing = TRUE),
    .(
      VertexID = Game,
      Label = V(g)[Game]$Label,
      Similarity = WeightIntersection,
      Debug
    ),
  ]
}
