require_relative '../tools/api_handler'

api = ApiHandler.new

def first_time_setup(api)
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

  offset = api.get_detailed_pokemon_offset

  puts 'Retrieving detailed Pokemon information...'
  puts 'Should take roughly 20+ min'
  api.get_detailed_pokemon_data(offset)
  puts ''
  puts 'Done.'
  puts ''

  # api.make_pokemon_data
  # puts''

  api.make_pokemon_type_data
  puts ''

  api.make_available_moves
  puts ''
end

def resume(api)
  api.get_type_data_from_api
  puts ''

  api.get_pokemon_data
  puts ''

  api.eliminate_extra_urls
  puts ''

  offset = api.get_detailed_pokemon_offset

  puts 'Retrieving detailed Pokemon information...'
  puts 'Should take roughly 20+ min'
  api.get_detailed_pokemon_data(offset)
  puts ''
  puts 'Done.'
  puts ''

  # api.make_pokemon_data
  # puts''

  api.make_pokemon_type_data
  puts ''

  api.make_available_moves
  puts ''
end

# first_time_setup(api)
resume(api)
