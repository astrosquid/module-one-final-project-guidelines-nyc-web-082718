require_relative '../config/environment'
require_relative '../tools/api_handler'
require_relative '../lib/game/display'

require 'pry'
require 'json'
require 'rest-client'
require 'io/console'

def welcome
  banner = File.read('./assets/banner.txt')
  puts banner
  puts ''
end

# Run

welcome

bul = Pokemon.find_by(name: 'bulbasaur')
cha = Pokemon.find_by(name: 'charmander')
squ = Pokemon.find_by(name: 'squirtle')
pik = Pokemon.find_by(name: 'pikachu')
eev = Pokemon.find_by(name: 'eevee')

dis = Display.new

dis.display_dialog "Hello there! Welcome to the world of pokémon! My name is Oak! People call me the pokémon Prof! This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. Myself...I study pokémon as a profession."
dis.display_dialog "Err - forgive me, but I forget your name. What was it again?"
name = gets.chomp
dis.display_dialog "Well then, #{name.capitalize}, welcome to the wonderful world of Pokemon!"
