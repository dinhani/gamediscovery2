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

QueryByGame(g, "Game Grand Theft Auto III")
QueryByFeatures(g, c("Platform PlayStation 2", "Platform PlayStation 3", "Genre Action"))


