# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")
library(igraph)

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/GenerateID.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("../2.3-dataframe-enhancer/data/games.rds")

# ==============================================================================
# GENERATE GRAPH
# ==============================================================================
# IDS
games <- games %>%
  mutate(
    ID = GenerateID("Game", Name),
    TypeID = GenerateID(Type, Value)
  )

# VERTICES
graph.vertices.games <- games %>%
  select(ID, Name) %>%
  rename(
    Label = Name
  ) %>%
  mutate(
    Type = "Game"
  ) %>%
  select(ID, Label, Type) %>%
  distinct(ID, .keep_all = TRUE)

graph.vertices.attributes <- games %>%
  select(TypeID, Type, Value) %>%
  distinct() %>%
  rename(
    ID = TypeID,
    Label = Value
  ) %>%
  select(ID, Label, Type) %>%
  distinct(ID, .keep_all = TRUE)

graph.vertices <- graph.vertices.games %>%
  union_all(graph.vertices.attributes) %>%
  distinct()

# EDGES
graph.edges <- games %>%
  select(ID, TypeID, Weight) %>%
  distinct()

# GRAPH
graph <- graph_from_data_frame(graph.edges, vertices = graph.vertices, directed = FALSE)

# ==============================================================================
# SAVE GRAPH
# ==============================================================================
saveRDS(graph, file = "data/graph.rds")
