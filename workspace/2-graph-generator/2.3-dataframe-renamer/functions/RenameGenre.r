# ==============================================================================
# Rename the Genre values
# ==============================================================================
RenameGenre <- function(genres) {
  genres <- str_replace(genres, "( game| video game)", "") %>%
    str_title_case()

  recode(genres,
    "Role-Playing (RPG)" = "RPG",
    "Role-Playing" = "RPG"
  )
}
