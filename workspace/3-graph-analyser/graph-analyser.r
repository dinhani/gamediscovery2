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

# ==============================================================================
# EXAMPLE QUERIES
# ==============================================================================
game = "game-assassins-creed-origins"
QueryByGame(g, game)
ego(g, 1, game)

features = c("platform-playstation-2", "platform-playstation-3", "genre-action")
QueryByFeatures(g, features)
