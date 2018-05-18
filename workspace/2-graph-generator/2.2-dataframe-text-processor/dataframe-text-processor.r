# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")
library(RWeka)

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../2.1-dataframe-joiner/data/games.rds")

# ==============================================================================
# PROCESS GAMES TEXTS
# ==============================================================================
games.corpus <- games$Texts$Description %>%
  na.fill("") %>%
  VectorSource() %>%
  VCorpus()

games.corpus <- games.corpus %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeWords, stopwords("en")) %>%
  tm_map(content_transformer(function(x) iconv(x, to = "ASCII//TRANSLIT")))

games.tdm <- TermDocumentMatrix(games.corpus,
  control = list(
    tokenize = function(x) NGramTokenizer(x, Weka_control(min = 1, max = 2))
  )
)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
games$TDM <- games.tdm
saveRDS(games, file = "data/games.rds")
