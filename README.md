# Module 1 Final
This project is intended for relationships between Pokemon moves and their respective element types.

## Requirements
Things needed to install the software and how to install them

## Installing

- clone this repo
- cd to it and `bundle install`
- run using `ruby bin/run.rb`

_Optionally:_
You may find it more authentic to install the Pokemon GB font. On Mac, this can be easily done by using Font Book. Drag the .tff file for your language into Font Book and it will install automatically. Then, go to your terminal settings and change the font to Pokemon GB.

# Relationships
A Pokemon has_many BattleMoves through AvailableMove.
A Pokemon belongs_to an ElementType.
A BattleMove hash_many Pokemon through AvailableMove.
A BattleMove belongs_to an ElementType.
AvailableMove belongs_to a Pokemon and a BattleMove.
An ElementType has_many Pokemon and many Moves.
A Move has an ElementType.

## Motivation

We wanted to explore the relationships between the following

## Objectives
As a user, I want to see the most & least common available move between all Pokemon.

As a user, I want to see Pokemon who possess the most and least amount of Moves that match their type. Pokemon

As a user, I want to see which Pokemon only have one ElementType. Pokemon

As a user, I want to see the most & least popular ElementTypes for all Pokemon. ElementType

As a user, I want to see the most & least popular ElementTypes for all Moves. ElementType

As a user, I want to see how many Pokemon comprise each ElementType and name them. ElementType

As a user, I want to see all the Pokemon that can be assigned a specific Move. Move
