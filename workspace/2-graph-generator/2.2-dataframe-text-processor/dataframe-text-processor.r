# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")
library(tm)

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../2.1-dataframe-joiner/data/games.rds")

# ==============================================================================
# PROCESS GAMES TEXTS
# ==============================================================================
games.corpus = games$Texts$Description %>% VectorSource() %>% VCorpus()
games.corpus = games.corpus %>% tm_map(removePunctuation) %>% tm_map(content_transformer(iconv))
games.tdm = TermDocumentMatrix(games.corpus)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
games$TDM = games.tdm
saveRDS(games, file = "data/games.rds")
