# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libs/packages.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("2-graph-generator/2.1-dataframe-joiner/data/games.rds")

# ==============================================================================
# PROCESS GAMES TEXTS
# ==============================================================================

# tokens
corpus <- games$Texts$Description
corpus_tokens <- str_to_lower(corpus)
corpus_tokens <- tokens(corpus_tokens, remove_punct = TRUE, remove_symbols = TRUE)
corpus_tokens <- tokens_remove(corpus_tokens, stopwords("en"))
corpus_tokens <- tokens_ngrams(corpus_tokens, n = 1:2, concatenator = " ")
names(corpus_tokens) <- seq_along(games$Texts$Description)

# dfm
corpus_dfm <- dfm(corpus_tokens)
corpus_dfm <- dfm_trim(corpus_dfm, min_termfreq = 10)

# tm
corpus_tm <- convert(corpus_dfm, "tm")

# ==============================================================================
# SAVE GAMES
# ==============================================================================
games$TDM <- corpus_tm
saveRDS(games, file = "2-graph-generator/2.2-dataframe-text-processor/data/games.rds")
