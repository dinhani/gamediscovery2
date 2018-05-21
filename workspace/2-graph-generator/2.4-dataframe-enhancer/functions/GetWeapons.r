# ==============================================================================
# Weapons to be identified
# ==============================================================================
GetWeapons <- function() {
  values <- c()

  # Categories
  values <- c(
    values,
    "Explosive",
    "Firearm",
    "Whitearm"
  )

  # Defense
  values <- c(
    values,
    "Armor",
    "Helm",
    "Helmet",
    "Hood",
    "Shield"
  )

  # Explosives
  values <- c(
    values,
    "Bazooka",
    "C4",
    "Flashbang",
    "Grenade",
    "Missile",
    "TNT"
  )

  # Firearms
  values <- c(
    values,
    "Assault Rifle",
    "Flamethrower",
    "Grenade Launcher",
    "Laser",
    "Pistol",
    "Revolver",
    "Rifle",
    "Rocket Launcher",
    "Shotgun",
    "Sniper Rifle",
    "Submachine Gun / SMG",
    "submachine gun",
    "Turret"
  )

  # Specific Weapons
  values <- c(
    values,
    "AK-47",
    "Beretta",
    "FAMAS",
    "FlaK 88",
    "M-79",
    "M1 Carbine",
    "M1 Garand",
    "M14",
    "M16",
    "M21",
    "M249",
    "MP40",
    "MP5",
    "Magnum",
    "Mosin-Nagant",
    "RPG-7",
    "SPAS-12",
    "SVD",
    "svd",
    "dragunov",
    "Skorpion",
    "Thompson",
    "Uzi"
  )

  # White Arms
  values <- c(
    values,
    "Axe",
    "Blade",
    "Bow",
    "Crossbow",
    "Halberd",
    "Hammer",
    "Katana",
    "Mace",
    "Maul",
    "Nunchaku",
    "Spear",
    "Staff",
    "magic staff",
    "Sword",
    "Trident"
  )

  return(values)
}
