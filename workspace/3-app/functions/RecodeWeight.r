# ==============================================================================
# Set the weight of each type to be used in the recommendations
# ==============================================================================
RecodeWeight <- function(types) {
  NONE <- 0
  MEDIUM <- 1
  MEDIUM_HIGH <- 2
  HIGH <- 4
  HIGHEST <- 8

  recode(
    types,

    # HIGHEST
    "Genre" = HIGHEST,
    "Setting" = HIGHEST,
    "Mechanic" = HIGHEST,

    # HIGH
    "Graphics" = HIGH,
    "Characte" = HIGH,
    "Sport" = HIGH,
    "Vehicle" = HIGH,

    # MEDIUM HIGH
    "Rating" = MEDIUM_HIGH,

    # MEDIUM
    "Developer" = MEDIUM,
    "Person" = MEDIUM,

    # NONE
    .default = NONE
  )
}
