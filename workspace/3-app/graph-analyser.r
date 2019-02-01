# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
list.files("3-app/functions/", full.names = TRUE) %>% walk(source, encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
g <- readRDS("3-app/data/graph.rds")
g.es <- E(g)

# ==============================================================================
# EXAMPLE QUERIES
# ==============================================================================
game <- "game-24589167" # God of War
QueryByGame(g, g.es, game)
ego(g, 1, game)

game.features <- c("platform-playstation-3", "mechanic-squad")
QueryByFeatures(g, g.es, game.features)$Label

QueryByGameAndFeatures(g, g.es, game, game.features)$Label %>% head(20)
