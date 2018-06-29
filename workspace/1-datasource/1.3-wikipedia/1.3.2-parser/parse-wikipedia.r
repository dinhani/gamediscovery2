# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../../libraries.r", encoding = "UTF-8")

cl <- makeCluster(7)
clusterEvalQ(cl, library(dplyr))
clusterEvalQ(cl, library(rvest))
clusterEvalQ(cl, library(stringr))

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/ParseWikipediaHtmlFile.r", encoding = "UTF-8")

# ==============================================================================
# READ FILES
# ==============================================================================
games.files <- list.files("../1.3.1-downloader/data/", pattern = "*.html", full.names = TRUE)

# ==============================================================================
# PARSE FILES
# ==============================================================================
games <- pblapply(cl = cl, games.files, ParseWikpidiaHTMLFile) %>%
  rbindlist(fill = TRUE)

# add column prefix
colnames(games) <- paste0("WP_", colnames(games))

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
