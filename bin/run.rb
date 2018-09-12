require_relative '../config/environment'
require_relative '../tools/api_handler'

require 'pry'
require 'json'
require 'rest-client'

api = ApiHandler.new

# get_type_and_move_data
puts ''
api.get_type_data_from_api
puts ''
api.make_type_data
puts ''
api.make_move_data
puts ''
api.get_pokemon_data
puts ''
api.get_detailed_pokemon_data(3)
puts ''

# Prune Pokemon data (no mega-evolutions.)
Pokemon.all = Pokemon.all.select do |pokemon|
  pokemon.id <= 802
end

api.make_pokemon_data
puts ''
api.make_pokemon_type_data
puts ''
api.make_available_moves
puts ''

# assign_types_and_moves_to_pokemon

binding.pry
