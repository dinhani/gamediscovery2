# ==============================================================================
# Set the release year of the games
# ==============================================================================
SetYear <- function(games.attributes) {
  games.attributes[Type == "Year", Value := as_date(Value) %>% year() %>% as.character(), ][]
}
