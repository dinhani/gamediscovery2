# ==============================================================================
# Read Wikidata relationship file
# ==============================================================================
ParseWikidataRelationshipFile <- function(filename) {
  print(filename)

  # read file
  df <- fread(filename)

  # columns: [1=GameLabel, 2=RelationshipLabel, 3=GameID, 4=RelationshipID]
  df[, c(3, 4, 2)] %>%
    # parse IDs
    mutate_at(
      vars(ends_with("ID")),
      ParseWikidataID
    ) %>%
    # parse Labels
    mutate_at(
      vars(ends_with("Label")),
      ParseWikidataLabel
    ) %>%
    # group by game
    group_by(GameID) %>%
    summarise_all(list)
}
