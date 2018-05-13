RenameRatingESRB <- function(ratings) {
  recode(ratings,
    "Adults Only" = "Adults Only 18+",
    "Mature" = "Mature 17+"
  )
}
