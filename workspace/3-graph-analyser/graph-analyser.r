# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../libraries.r", encoding = "UTF-8")
library(igraph)

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/QueryByFeatures.r", encoding="UTF-8")
source("functions/QueryByGame.r",     encoding="UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
g = readRDS("../2-graph-generator/2.4-dataframe-to-graph/data/graph.rds")
g.es = E(g)

# ==============================================================================
# EXAMPLE QUERIES
# ==============================================================================
game = "game-the-witcher-3-wild-hunt"
t1 = Sys.time()
QueryByGame(g, g.es, game)
Sys.time() - t1

features = c("platform-playstation-2", "platform-playstation-3", "genre-action")
QueryByFeatures(g, features)
