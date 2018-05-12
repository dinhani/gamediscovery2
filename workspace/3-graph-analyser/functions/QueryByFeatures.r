QueryByFeatures = function(g, features){
    # query all games that have the requested features
    games.ids.list = lapply(features, FUN=ego, g=g, order=1) # `ego` get the features neighbors
    games.ids.list = lapply(games.ids.list, FUN='[[', 1)     # `[[` extracts the vector from the `ego` result list

    # keep the games that appears for all requested features
    games.ids = reduce(games.ids.list, intersect)

    # extract vertices that are games from graph
    games.vertices = V(g)[games.ids]
    games.vertices[games.vertices$Type == "Game"]
}
