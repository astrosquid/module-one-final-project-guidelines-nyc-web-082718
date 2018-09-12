class ApiHandler
  def initialize
    @type_data = nil
  end

  def get_type_data
    if @type_data
      @type_data
    else
      get_type_data_from_api
    end
  end

  def get_type_and_move_data
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
  end

  def get_type_data_from_api
    url = "https://pokeapi.co/api/v2/type/"
    get_data(url)
  end

  def get_pokemon_data
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
  end

  def assign_types_to_pokemon(a_pokemon, a_pokemons_info)
    pokemon_types = a_pokemons_info['types'].map do |type_data|
      type_data['type']['name']
    end

    pokemon_types.each do |current_pokemon_type|
      PokemonType.new(a_pokemon, ElementType.get_type_by_name(current_pokemon_type))
    end

    p_types = PokemonType.get_pokemon_types_by_pokemon(a_pokemon).map do |p_type|
      p_type.element_type.name
    end
    puts "Assigning types to #{a_pokemon.name}: #{p_types}"
  end

  def assign_moves_to_pokemon(a_pokemon, a_pokemons_info)
    puts "Assigning moves to " + a_pokemon.name
    pokemon_moves = a_pokemons_info['moves'].map do |move_data|
      move_data['move']['name'] # => "tackle"
    end

    pokemon_moves.each do |move_name|
      move = Move.find_move_by_name(move_name)
      AvailableMove.new(a_pokemon, move)
    end

    binding.pry
  end

  def get_data(link)
    JSON.parse(RestClient.get(link))
  end

  # Doing both because we're fetching the Pokemon data here.
  # Should be refactored further so we aren't doing this.
  def assign_types_and_moves_to_pokemon
    Pokemon.all.each do |pokemon|
      info = get_data(pokemon.url)
      assign_types_to_pokemon(pokemon, info)
      puts ''
      assign_moves_to_pokemon(pokemon, info)
    end
  end

end
