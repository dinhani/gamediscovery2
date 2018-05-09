QueryByFeatures = function(g, vertices){
    # query nearest vertices games and features
    nearest.vertices.ids = lapply(vertices, FUN=ego, g=g, order=2)
    nearest.vertices.ids = lapply(nearest.vertices.ids, FUN='[[', 1)

    # keep vertices that appear for all features (intersect)
    nearest.vertices.ids = reduce(nearest.vertices.ids, intersect)
    nearest.vertices.ids = as.numeric(as.character(nearest.vertices.ids))

    # extract vertices that are games from graph
    nearest.vertices = V(g)[nearest.vertices.ids]
    nearest.vertices[nearest.vertices$Type == "Game"]
}
