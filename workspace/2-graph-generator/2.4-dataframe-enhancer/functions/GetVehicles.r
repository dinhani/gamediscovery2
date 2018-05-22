# ==============================================================================
# Vehicles to be identified
# ==============================================================================
GetVehicles <- function() {
  values <- list()

  # Jets
  values <- append(
    values,
    list(
      "F-15",
      "F-16",
      "F-22",
      "F-35",
      "Gripen",
      "MIG-31"
    )
  )

  # Not Motorized
  values <- append(
    values,
    list(
      "Bike",
      "Skate"
    )
  )

  # Motorized
  values <- append(
    values,
    list(
      "Boat",
      "Bus",
      "Car",
      "Helicopter",
      "Hovercraft",
      "Motorcycle",
      "Plane",
      "Rocket",
      "Ship",
      "Starship",
      "Train",
      "Truck"
    )
  )

  # Manufactures
  values <- append(
    values,
    list(
      "Acura",
      "Alfa Romeo",
      "Aston Martin",
      "Audi",
      "BMW",
      "Buick",
      "Chevrolet",
      "Citroën",
      "FIAT",
      "Ferrari",
      "Ford",
      "Honda",
      "Hyundai",
      "Jaguar",
      "Jeep",
      "Lamborghini",
      "Lexus",
      "Mazda",
      "Mercedes-Benz",
      "Mitsubishi",
      "Nissan",
      "Peugeot",
      "Plymouth",
      "Porsche",
      "Renault",
      "Shelby",
      "Subaru",
      "Suzuki",
      "TVR",
      "Toyota",
      "Volkswagen",
      "Volvo"
    )
  )

  # War
  values <- append(
    values,
    list(
      "Submarine",
      "Tank"
    )
  )

  return(values)
}
