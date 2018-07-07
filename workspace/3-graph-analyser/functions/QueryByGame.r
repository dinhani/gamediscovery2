# ==============================================================================
# Query the game graph for games similar to the requested game
# ==============================================================================
QueryByGame <- function(g, g.es, game) {

  # get features connected to the requested game
  features.vertices <- adjacent_vertices(g, game)[[1]]
  features.vertices.types <- features.vertices$Type
  features.vertices.types.table <- table(features.vertices.types)

  # get edges between the found features and other games
  features.edges <- g.es[inc(features.vertices)]
  features.edges.feature <- head_of(g, features.edges)
  features.edges.game <- tail_of(g, features.edges)
  features.edges.weight <- edge_attr(g, "Weight", features.edges)

  # generate a table to perform calculations
  games.df1 <- data.table(
    Game = features.edges.game,
    FeatureType = features.edges.feature$Type,
    Weight = features.edges.weight
  )

  # calculate type Weight with main game
  games.df2 <- games.df1[, .(FeatureCount = .N, Weight = mean(Weight)), by = .(Game, FeatureType)]
  games.df2$MainGameFeatureCount <- features.vertices.types.table[games.df2$FeatureType]
  games.df2$FeatureIntersection <- games.df2$FeatureCount / games.df2$MainGameFeatureCount
  games.df2$Weight <- games.df2$Weight * games.df2$FeatureIntersection

  # calculate Weight of each game with main game
  games.df3 <- games.df2[, .(Weight = sum(Weight)), by = .(Game)]

  # get games games ordered by best Weights and extract
  games.ids <- games.df3[order(Weight, decreasing = TRUE), Game, ]
  V(g)[games.ids]
}
