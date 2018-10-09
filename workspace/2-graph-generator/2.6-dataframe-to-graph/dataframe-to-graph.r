# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("2-graph-generator/2.6-dataframe-to-graph/functions/GenerateID.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games <- readRDS("2-graph-generator//2.5-dataframe-discarder/data/games.rds")

# ==============================================================================
# GENERATE GRAPH
# ==============================================================================
# IDS
games.ids <- games$Attributes %>%
  mutate(
    ID = GenerateID("Game", ID),
    TypeID = GenerateID(Type, Value)
  )

# VERTICES
graph.vertices.games <- games.ids %>%
  select(ID, Name) %>%
  rename(
    Label = Name
  ) %>%
  mutate(
    Type = "Game"
  ) %>%
  select(ID, Label, Type) %>%
  distinct(ID, .keep_all = TRUE)

graph.vertices.attributes <- games.ids %>%
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
graph.edges <- games.ids %>%
  select(ID, TypeID, Weight) %>%
  distinct()

# GRAPH
graph <- graph_from_data_frame(graph.edges, vertices = graph.vertices, directed = FALSE)

# ==============================================================================
# SAVE GRAPH
# ==============================================================================
saveRDS(graph, file = "2-graph-generator/2.6-dataframe-to-graph/data/graph.rds")
