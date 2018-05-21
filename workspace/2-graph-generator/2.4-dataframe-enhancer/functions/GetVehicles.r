# ==============================================================================
# Vehicles to be identified
# ==============================================================================
GetVehicles <- function() {
  values <- c()

  # Jets
  values <- c(values, "F-15", "F-16", "F-22", "F-35", "Gripen", "MIG-31")

  # Not Motorized
  values <- c(values, "Bike", "Skate")

  # Motorized
  values <- c(values, "Boat", "Bus", "Car", "Helicopter", "Hovercraft", "Motorcycle", "Plane", "Rocket", "Ship", "Starship", "Train", "Truck")

  # Manufactures
  values <- c(values, "Acura", "Alfa Romeo", "Aston Martin", "Audi", "BMW", "Buick", "Chevrolet", "Citroën", "FIAT", "Ferrari", "Ford", "Honda", "Hyundai", "Jaguar", "Jeep", "Lamborghini", "Lexus", "Mazda", "Mercedes-Benz", "Mitsubishi", "Nissan", "Peugeot", "Plymouth", "Porsche", "Renault", "Shelby", "Subaru", "Suzuki", "TVR", "Toyota", "Volkswagen", "Volvo")

  # War
  values <- c(values, "Submarine", "Tank")

  return(values)
}
