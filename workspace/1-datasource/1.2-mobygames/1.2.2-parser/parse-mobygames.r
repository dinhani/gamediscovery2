# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../../libraries.r", encoding = "UTF-8")

cl = makeCluster(7)
clusterEvalQ(cl, library(dplyr))
clusterEvalQ(cl, library(zoo))
clusterEvalQ(cl, library(rvest))
clusterEvalQ(cl, library(stringr))


# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/ParseMobyGamesHTMLFile.r", encoding="UTF-8")
clusterExport(cl, c("ParseMobyGamesHTMLFile", "ParseMobyGamesSection"))

# ==============================================================================
# READ FILES
# ==============================================================================
games.files = list.files("../1.2.1-downloader/data/", pattern = "*.html", full.names = TRUE)

# ==============================================================================
# PARSE FILES
# ==============================================================================
games = pblapply(cl=cl, games.files, ParseMobyGamesHTMLFile) %>%
  rbindlist(fill = TRUE) %>%
  mutate(
    Platform = if_else(is.na(Platforms), Platform, Platforms)
  )

# add column prefix
colnames(games) = paste0("MB_", colnames(games))

# ==============================================================================
# SAVE GAME INFO
# ==============================================================================
saveRDS(games, file = "data/games.rds")
