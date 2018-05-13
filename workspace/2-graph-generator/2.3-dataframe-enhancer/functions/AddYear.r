AddYear <- function(games) {
  games[Type == "Year", Value := as_date(Value) %>% year() %>% as.character(), ][]
}
