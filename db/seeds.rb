require_relative '../tools/api_handler'

# fire_type = ElementType.create({name: 'fire'})
#
# flamethrower = Move.create({name: 'flamethrower', element_type_id: fire_type.id})
#
# char = Pokemon.create({name:'charmeleon'})
#
# PokemonType.create({pokemon_id: char.id, element_type_id: fire_type.id})
#
# AvailableMove.create({pokemon_id:char.id, move_id:flamethrower.id})

api = ApiHandler.new

api.get_type_data_from_api
puts ''

api.make_type_data
puts ''

api.make_move_data
puts ''

api.get_pokemon_data
puts ''

api.eliminate_extra_urls
puts ''

puts 'Retrieving detailed Pokemon information...'
puts 'Should take roughly 20+ min'
api.get_detailed_pokemon_data
puts ''
puts 'Done.'
puts ''

api.make_pokemon_data
puts''

api.make_pokemon_type_data
puts ''

api.make_available_moves
puts ''
