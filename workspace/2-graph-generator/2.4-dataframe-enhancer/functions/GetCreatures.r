# ==============================================================================
# Creatures to be identified
# ==============================================================================
GetCreatures <- function() {
  values <- list()

  # Animals
  values <- append(
    values,
    list(
      "Bat",
      "Bear",
      "Bee",
      "Cat",
      "Chicken",
      "Cow",
      "Crab",
      "Crow",
      "Deer",
      "Dinosaur",
      "Dog",
      "Dolphin",
      "Elk",
      "Goat",
      "Horse",
      "Insect",
      "Lion",
      "Monkey",
      "Mule",
      "Panda",
      "Pig",
      "Rabbit",
      "Sabre Cat",
      "Shark",
      "Sheep",
      "Spider",
      "Unicorn",
      "Whale",
      "Wolf"
    )
  )

  # Humans
  values <- append(
    values,
    list(
      "Archer",
      "Barbarian",
      "Bard",
      "Dancer",
      "Emperor",
      "King",
      "Mage",
      "Manager",
      "Medic",
      "Monk",
      "Ninja",
      "Pharaoh",
      "Pilot",
      "Pirate",
      "Police Officer",
      "Priest",
      "Prince",
      "Princess",
      "Queen",
      "Samurai",
      "Scientist",
      "Singer",
      "Soldier",
      "Sultan",
      "Thief",
      "Warrior",
      "Wizard"
    )
  )

  # Mythic
  values <- append(
    values,
    list(
      "Basilisk",
      "Cerberus",
      "Chimera",
      "Cockatrice",
      "Hydra",
      "Ifrit",
      "Kraken",
      "Manticore",
      "Minotaur",
      "Yeti"
    )
  )

  # RPG
  values <- append(
    values,
    list(
      "Cyclops",
      "Dragon",
      "Draugr",
      "Dwarf",
      "Elf",
      "Ghost",
      "Ghoul",
      "Giant",
      "Gnoll",
      "Goblin",
      "Golem",
      "Human",
      "Kobold",
      "Ogre",
      "Orc",
      "Shade",
      "Skeleton",
      "Slime",
      "Troll",
      "Undead",
      "Werewolf",
      "Witch",
      "Wraith",
      "Wyvern"
    )
  )

  # Others
  values <- append(
    values,
    list(
      "Alien",
      "Angel",
      "Automaton",
      "Centaur",
      "Colossus",
      "Demon",
      "Harppia",
      "Mecha",
      "Medusa",
      "Mermaid",
      "Monster",
      "Mummy",
      "Mutant",
      "Robot",
      "Vampire",
      "Zombie"
    )
  )

  return(values)
}
