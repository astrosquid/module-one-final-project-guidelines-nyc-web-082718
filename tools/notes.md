# Models.

- pokemon
- battle_move
- available_move
- element_type
- pokemon_type

# Relations.

A Pokemon has many BattleMoves through AvailableMove.
A BattleMove has many Pokemon through AvailableMove.
AvailableMove belongs to a Pokemon and a BattleMove.
A Pokemon belongs to an ElementType.
A BattleMove belongs to an ElementType.
An ElementType has many Pokemon and many Moves.
A Move has an ElementType.

# Objectives.

<!-- As a user, I want to see the most & least common available move between all Pokemon. -->

<!-- As a user, I want to see all the Pokemon that can be assigned a specific Move. -->

<!-- As a user, I want to see the most & least popular ElementTypes for all Pokemon -->

<!-- As a user, I want to see the most & least popular ElementTypes for all Moves. -->

<!-- As a user, I want to see Pokemon who possess the most and least amount of Moves that match their type. -->

As a user, I want to see how many Pokemon comprise each ElementType and name them.
#iterate through pokemon, for each pokemon get their types, and #use types to add pokemon to the hash
#key = element type, value = array of pokemon(result)

As a user, I want to see which Pokemon only have one ElementType.
#pokemon that has only 1 element type

# Tables.

## moves
name => "mega-punch"
url => "https://pokeapi/moves"
elemental_type_id => 5

## pokemon
name => bulbasaur
url => pokeapi.co/api/whatever

## pokemon_types
pokemon_id, type_id

## available_moves
pokemon_id, move_id

## element_types
name => "normal", "fire", "ghost"

# Setup
