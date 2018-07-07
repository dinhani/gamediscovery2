# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../libraries.r", encoding = "UTF-8")
library(igraph)

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/QueryByGame.r", encoding = "UTF-8")
source("functions/QueryByFeatures.r", encoding = "UTF-8")
source("functions/QueryByGameAndFeatures.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
g <- readRDS("../2-graph-generator/2.6-dataframe-to-graph/data/graph.rds")
g.es <- E(g)

# ==============================================================================
# EXAMPLE QUERIES
# ==============================================================================
game <- "game-753511" # Mass Effect 3
QueryByGame(g, g.es, game)$Label %>% head(20)
ego(g, 1, game)

features <- c("platform-playstation-3", "mechanic-squad")
QueryByFeatures(g, g.es, features)$Label

QueryByGameAndFeatures(g, g.es, game, features)


