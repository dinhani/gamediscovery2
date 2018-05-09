QueryByGame = function(g, game){
  # get neighbor games related to all neighbor features
  neighbor.features       = adjacent_vertices(g, game)[[1]]
  neighbor.features.games = adjacent_vertices(g, neighbor.features)

  # arrange games according to how many times they appear (most similar)
  similar.games.ids = table(unlist(neighbor.features.games)) %>% as.data.frame() %>% arrange(desc(Freq)) %>% .[,1]
  similar.games.ids = as.numeric(as.character(similar.games.ids))

  # extract games
  V(g)[similar.games.ids]
}
