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
# BASE FOR GRAPH
games.and.attributes <- games$Attributes %>%
  left_join(games$Images, by = c("ID", "Name")) %>% 
  mutate(
    ID = GenerateID("Game", ID),
    TypeID = GenerateID(Type, Value)
  )

# VERTICES - GAMES
graph.vertices.games <- games.and.attributes %>%
  select(ID, Name, Type, Cover) %>%
  rename(
    Label = Name
  ) %>%
  mutate(
    Type = "Game"
  ) %>%
  distinct(ID, .keep_all = TRUE)

# VERTICES - NOT GAMES
graph.vertices.attributes <- games.and.attributes %>%
  select(TypeID, Type, Value) %>%
  distinct() %>%
  rename(
    ID = TypeID,
    Label = Value
  ) %>%
  distinct(ID, .keep_all = TRUE)

graph.vertices <- graph.vertices.games %>%
  union_all(graph.vertices.attributes) %>%
  distinct()

# EDGES
graph.edges <- games.and.attributes %>%
  select(ID, TypeID, Weight) %>%
  distinct()

# GRAPH
graph <- graph_from_data_frame(graph.edges, vertices = graph.vertices, directed = FALSE)

# ==============================================================================
# SAVE GRAPH
# ==============================================================================
saveRDS(graph, file = "2-graph-generator/2.6-dataframe-to-graph/data/graph.rds")
saveRDS(graph, file = "3-graph-analyser/data/graph.rds")
