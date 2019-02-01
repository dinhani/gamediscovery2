# ==============================================================================
# Query the game graph for games containing all the requested features
# ==============================================================================
QueryByFeatures <- function(g, g.es, features) {
  
  # get edges between the features and the games
  features.edges <- g.es[inc(features)]
  features.edges.feature <- head_of(g, features.edges)
  features.edges.game <- tail_of(g, features.edges)

  # generate a table to perform calculations
  games.df1 <- data.table(
    Game = features.edges.game,
    Weight = RecodeWeight(features.edges.feature$Type)
  )

  # calculate weight of games for the features
  games.df2 = games.df1[, .(FeatureCount = .N, Weight = sum(Weight)), by = Game]

  # keep only games that have all features
  games.df3 = games.df2[FeatureCount == length(features),,]

  # extract games vertices
  games.ids <- games.df3[order(Weight, decreasing = TRUE), Game, ]
  V(g)[games.ids]
}