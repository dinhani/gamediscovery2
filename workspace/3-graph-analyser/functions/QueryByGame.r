# ==============================================================================
# Query the game graph for games similar to the requested game
# ==============================================================================
QueryByGame <- function(g, g.es, game) {

  # get features connected to the requested game
  features.vertices <- adjacent_vertices(g, game)[[1]]
  features.vertices.types <- features.vertices$Type
  features.vertices.types.table <- table(features.vertices.types)

  # get edges between the found features and other games
  features.vertices.edges <- g.es[inc(features.vertices)]
  features.vertices.edges.feature <- head_of(g, features.vertices.edges)
  features.vertices.edges.game <- tail_of(g, features.vertices.edges)
  features.vertices.edges.weight <- edge_attr(g, "Weight", features.vertices.edges)

  # generate a table to perform calculations
  games.df1 <- data.table(
    Game = features.vertices.edges.game$name,
    FeatureType = features.vertices.edges.feature$Type,
    FeatureWeight = features.vertices.edges.weight
  )

  # calculate type intersection with main game
  games.df2 <- games.df1[, .(FreqIntersection = mean(FeatureWeight) * (.N / features.vertices.types.table[FeatureType])), by = .(Game, FeatureType)]

  # calculate intersection of each game with main game
  games.df3 <- games.df2[, .(FreqIntersectionTotal = sum(FreqIntersection)), by = .(Game)]

  # get games games ordered by best intersections
  games.ids <- games.df3[order(FreqIntersectionTotal, decreasing = TRUE), Game, ]

  # extract games vertices
  V(g)[games.ids]
}
