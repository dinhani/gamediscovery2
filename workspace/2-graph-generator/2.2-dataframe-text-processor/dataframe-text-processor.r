# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("2-graph-generator//2.1-dataframe-joiner/data/games.rds")

# ==============================================================================
# PROCESS GAMES TEXTS
# ==============================================================================
games.corpus <- games$Texts$Description %>%
  na.fill("") %>%
  VectorSource() %>%
  VCorpus()

games.corpus.processed <- games.corpus
games.corpus.processed <- tm_map(games.corpus.processed, content_transformer(function(x) iconv(x, to = "ASCII//TRANSLIT")))
games.corpus.processed <- tm_map(games.corpus.processed, content_transformer(str_replace_all), pattern = "[^A-Za-z'-]", replacement = " ")
games.corpus.processed <- tm_map(games.corpus.processed, stripWhitespace)
games.corpus.processed <- tm_map(games.corpus.processed, content_transformer(tolower))
games.corpus.processed <- tm_map(games.corpus.processed, removeWords, stopwords("en"))

games.tdm <- TermDocumentMatrix(games.corpus.processed,
  control = list(
    tokenize = function(x) NGramTokenizer(x, Weka_control(min = 1, max = 2)),
    bounds = list(global = c(3, Inf))
  )
)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
games$TDM <- games.tdm
saveRDS(games, file = "2-graph-generator/2.2-dataframe-text-processor/data/games.rds")
