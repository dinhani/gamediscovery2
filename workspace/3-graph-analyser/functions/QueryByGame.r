# ==============================================================================
# Query the game graph for games similar to the requested game
# ==============================================================================
QueryByGame <- function(g, g.es, game) {

  # get features connected to the requested game
  features.vertices <- adjacent_vertices(g, game)[[1]]
  features.types <- features.vertices$Type
  features.types.table <- table(features.types)

  # get edges between the found features and other games
  features.edges <- g.es[inc(features.vertices)]
  features.edges.features <- head_of(g, features.edges)
  features.edges.games <- tail_of(g, features.edges)
  features.edges.weights <- edge_attr(g, "Weight", features.edges)

  # generate a table to perform calculations
  games.df1 <- data.table(
    Game = features.edges.games$name,
    FeatureType = features.edges.features$Type,
    FeatureWeight = features.edges.weights
  )

  # calculate type intersection with main game
  games.df2 <- games.df1[, .(FreqIntersection = mean(FeatureWeight) * (.N / features.types.table[FeatureType])), by = .(Game, FeatureType)]

  # calculate intersection of each game with main game
  games.df3 <- games.df2[, .(FreqIntersectionTotal = sum(FreqIntersection)), by = .(Game)]

  # get games games ordered by best intersections
  games.ids <- games.df3[order(FreqIntersectionTotal, decreasing = TRUE), Game, ]

  # extract games vertices
  V(g)[games.ids]
}
