# Module 1 Final
This project is intended for relationships between Pokemon moves and their respective element types.

## Requirements
Things needed to install the software and how to install them

## Installng
Step by step series of examples that tell you how to get a development env running

# Relationships
A Pokemon has_many BattleMoves through AvailableMove.
A Pokemon belongs_to an ElementType.
A BattleMove hash_many Pokemon through AvailableMove.
A BattleMove belongs_to an ElementType.
AvailableMove belongs_to a Pokemon and a BattleMove.
An ElementType has_many Pokemon and many Moves.
A Move has an ElementType.

## Motivation


## Objectives
As a user, I want to see the most & least common available move between all Pokemon.

As a user, I want to see Pokemon who possess the most and least amount of Moves that match their type. Pokemon

As a user, I want to see which Pokemon only have one ElementType. Pokemon

As a user, I want to see the most & least popular ElementTypes for all Pokemon. ElementType

As a user, I want to see the most & least popular ElementTypes for all Moves. ElementType

As a user, I want to see how many Pokemon comprise each ElementType and name them. ElementType

As a user, I want to see all the Pokemon that can be assigned a specific Move. Move
