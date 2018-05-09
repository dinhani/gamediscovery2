# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")
library(igraph)

# ==============================================================================
# READ GAMES
# ==============================================================================
games = readRDS("../2.2-dataframe-recoder/data/games.rds")

# ==============================================================================
# GENERATE GRAPH
# ==============================================================================
# DF
graph.df = games %>%
  gather(AttrKey, AttrValue,-c(ID, Name)) %>%
  filter(sapply(AttrValue, negate(is.null))) %>%
  unnest() %>%
  mutate(
    ID = paste("Game", Name),
    AttrID = paste(AttrKey, AttrValue)
  )

# VERTICES
graph.vertices1 = graph.df %>%
  select(ID, Name) %>%
  rename(
    Label = Name
  ) %>%
  mutate(
    Type = "Game"
  ) %>%
  select(ID, Label, Type)

graph.vertices2 = graph.df %>%
  select(AttrID, AttrKey, AttrValue) %>%
  distinct() %>%
  rename(
    ID  = AttrID,
    Label = AttrValue,
    Type = AttrKey
  ) %>%
  select(ID, Label, Type)

graph.vertices = graph.vertices1 %>%
  union_all(graph.vertices2) %>%
  distinct()

# EDGES
graph.edges = graph.df %>%
  select(ID, AttrID) %>%
  distinct() %>%
  mutate(
    Weight = 1
  )

# GRAPH
graph = graph_from_data_frame(graph.edges, vertices = graph.vertices, directed = FALSE)

# ==============================================================================
# SAVE GRAPH
# ==============================================================================
saveRDS(graph, file = "data/graph.rds")
