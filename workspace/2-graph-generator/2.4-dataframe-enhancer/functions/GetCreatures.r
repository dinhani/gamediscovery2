# ==============================================================================
# Creatures to be identified
# ==============================================================================
GetCreatures <- function() {
  creatures = c()

  # Animals
  creatures <- c(creatures, "Bat", "Bear", "Bee", "Cat", "Chicken", "Cow", "Crab", "Crow", "Deer", "Dinosaur", "Dog", "Dolphin", "Elk", "Goat", "Horse", "Insect", "Lion", "Monkey", "Mule", "Panda", "Pig", "Rabbit", "Sabre Cat", "Shark", "Sheep", "Spider", "Unicorn", "Whale", "Wolf")

  # Humans
  creatures <- c(creatures, "Archer", "Barbarian", "Bard", "Dancer", "Emperor", "King", "Mage", "Manager", "Medic", "Monk", "Ninja", "Pharaoh", "Pilot", "Pirate", "Police Officer", "Priest", "Prince", "Princess", "Queen", "Samurai", "Scientist", "Singer", "Soldier", "Sultan", "Thief", "Warrior", "Wizard")

  # Mythic
  creatures <- c(creatures, "Basilisk", "Cerberus", "Chimera", "Cockatrice", "Hydra", "Ifrit", "Kraken", "Manticore", "Minotaur", "Yeti")

  # RPG
  creatures <- c(creatures, "Cyclops", "Dragon", "Draugr", "Dwarf", "Elf", "Ghost", "Ghoul", "Giant", "Gnoll", "Goblin", "Golem", "Human", "Kobold", "Ogre", "Orc", "Shade", "Skeleton", "Slime", "Troll", "Undead", "Werewolf", "Witch", "Wraith", "Wyvern")

  # Others
  creatures <- c(creatures, "Alien", "Angel", "Automaton", "Centaur", "Colossus", "Demon", "Harppia", "Mecha", "Medusa", "Mermaid", "Monster", "Mummy", "Mutant", "Robot", "Vampire", "Zombie")

  return(creatures)
}
