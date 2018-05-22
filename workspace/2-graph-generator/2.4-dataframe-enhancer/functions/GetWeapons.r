# ==============================================================================
# Weapons to be identified
# ==============================================================================
GetWeapons <- function() {
  values <- list()

  # Categories
  values <- append(
    values,
    list(
      "Explosive",
      "Firearm",
      "Whitearm"
    )
  )

  # Defense
  values <- append(
    values,
    list(
      "Armor",
      "Helm",
      "Helmet",
      "Hood",
      "Shield"
    )
  )

  # Explosives
  values <- append(
    values,
    list(
      "Bazooka",
      "C4",
      "Flashbang",
      "Grenade",
      "Missile",
      "TNT"
    )
  )

  # Firearms
  values <- append(
    values,
    list(
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
  )

  # Specific Weapons
  values <- append(
    values,
    list(
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
  )

  # White Arms
  values <- append(
    values,
    list(
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
  )

  return(values)
}
