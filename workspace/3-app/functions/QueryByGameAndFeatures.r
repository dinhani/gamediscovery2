# ==============================================================================
# Query the game graph for games similar to the requested game and that also
# have the requested features
# ==============================================================================
QueryByGameAndFeatures <- function(g, g.es, game, features){
  # execute both queries
  results.bygame <- QueryByGame(g, g.es, game)
  results.byfeature <- QueryByFeatures(g, g.es, features)

  # intersect the results of both queries
  V(g)[intersect(results.bygame, results.byfeature)]
}
