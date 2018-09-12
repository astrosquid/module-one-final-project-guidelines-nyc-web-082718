require_relative '../config/environment'
require_relative '../tools/first_time_setup'

require 'pry'
require 'json'
require 'rest-client'

get_type_and_move_data

puts ''

get_pokemon_data

puts ''

# Prune Pokemon data (no mega-evolutions.)

Pokemon.all = Pokemon.all.select do |pokemon|
  pokemon.id <= 802
end

assign_types_and_moves_to_pokemon

binding.pry
