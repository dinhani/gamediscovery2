# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("3-graph-analyser/functions/QueryByGame.r", encoding = "UTF-8")
source("3-graph-analyser/functions/QueryByFeatures.r", encoding = "UTF-8")
source("3-graph-analyser/functions/QueryByGameAndFeatures.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
g <- readRDS("2-graph-generator/2.6-dataframe-to-graph/data/graph.rds")
g.es <- E(g)

# ==============================================================================
# EXAMPLE QUERIES
# ==============================================================================
game.id <- "game-753511" # Mass Effect 3
QueryByGame(g, g.es, game.id)$Label %>% head(20)
ego(g, 1, game.id)

game.features <- c("platform-playstation-3", "mechanic-squad")
QueryByFeatures(g, g.es, game.features)$Label

QueryByGameAndFeatures(g, g.es, game.id, game.features)$Label %>% head(20)
