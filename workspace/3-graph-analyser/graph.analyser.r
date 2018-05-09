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
game = "Game Grand Theft Auto III"
QueryByGame(g, game)

features = c("Platform PlayStation 2", "Platform PlayStation 3", "Genre Action")
QueryByFeatures(g, features)
