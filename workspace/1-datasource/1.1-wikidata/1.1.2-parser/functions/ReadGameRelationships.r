ReadGameRelationships = function(filename){
  print(filename)

  # read file
  df = fread(filename)

  # columns: [1=GameID, 2=GameLabel, 3=RelationshipID, 4=RelationshipLabel]
  df[,c(1,3,4)] %>%
      # parse IDs
      mutate_at(
        vars(ends_with("ID")),
        ParseEntityID
      ) %>%
      # parse Labels
      mutate_at(
        vars(ends_with("Label")),
        ParseEntityLabel
      ) %>%
      # group by game
      group_by(GameID) %>%
      summarise_all(list)
}
