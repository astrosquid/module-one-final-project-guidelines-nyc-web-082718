require_relative '../config/environment'

require 'pry'
require 'json'
require 'rest-client'

file = File.read('./tools/sample_charmander_data.json')
charmander = JSON.parse(file)

# Get type data.

next_url = "https://pokeapi.co/api/v2/type/"

types_info = JSON.parse(RestClient.get(next_url))
types_info['results'].each do |type_data|
  unless type_data['name'] == 'shadow' ||  type_data['name'] == 'unknown'
    # Make ElementTypes.
    current_type = ElementType.new(type_data['name'])
    puts "Fetching data and making moves for " + current_type.name
    type_url = type_data['url']
    type_data = JSON.parse(RestClient.get(type_url))
    type_data['moves'].each do |move_hash|
      # Make Moves.
      Move.new(move_hash['name'], current_type,move_hash['url'])
    end
  end
end

puts ''

# Get Pokemon Data.

next_url = "http://pokeapi.co/api/v2/pokemon/"
pokemon_names = []

while next_url != nil do
  puts "Current URL: " + next_url
  current_dataset = JSON.parse(RestClient.get(next_url))
  current_dataset['results'].each do |poke|
    Pokemon.new(poke['url'].split('/').last.to_i, poke['name'], poke['url'])
  end
  next_url = current_dataset.delete('next')
  pokemon_names << current_dataset['results'].flatten
end

puts ''

# Prune Pokemon data (no mega-evolutions.)

Pokemon.all = Pokemon.all.select do |pokemon|
  pokemon.id <= 802
end

# Assign Types to Pokemon by creating PokemonType objects.

Pokemon.all.each do |pokemon|
  pokemon_info = JSON.parse(RestClient.get(pokemon.url))
  pokemon_types = pokemon_info['types'].map do |type_data|
    type_data['type']['name']
  end

  pokemon_types.each do |current_pokemon_type|
    PokemonType.new(pokemon, ElementType.get_type_by_name(current_pokemon_type))
  end

  p_types = PokemonType.get_pokemon_types_by_pokemon(pokemon).map do |p_type|
    p_type.element_type.name
  end
  puts "Assigning types to #{pokemon.name}: #{p_types}"
end

binding.pry
