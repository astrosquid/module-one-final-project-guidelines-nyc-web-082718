class ApiHandler
  def initialize
    @type_data = []
    @pokemon_data = []
    @pokemon_urls = []
  end

  def get_type_data_from_api
    puts "Fetching type data."
    url = "https://pokeapi.co/api/v2/type/"
    types_info = get_data(url)

    puts "Fetching... "
    types_info['results'].each do |type_data|
      unless type_data['name'] == 'shadow' ||  type_data['name'] == 'unknown'
         print type_data['name'] + "... "
        @type_data << get_data(type_data['url'])
      end
    end
  end

  def make_type_data
    @type_data.each do |element|
      puts 'Making ElementType ' + element["name"]
      ElementType.new(element["name"])
    end
  end

  def make_move_data
    @type_data.each do |element|
      puts "Making moves for " + element["name"]
      element['moves'].each do |type_move|
        Move.new(type_move['name'], ElementType.get_type_by_name(element["name"]), type_move['url'])
      end
    end
  end

  def get_pokemon_data
    puts "Fetching Pokemon URLs."
    next_url = "http://pokeapi.co/api/v2/pokemon/"


    while next_url != nil do
      puts "Current URL: " + next_url
      current_dataset = get_data(next_url)
      current_dataset['results'].each do |poke|
        @pokemon_urls << poke['url']
      end
      next_url = current_dataset['next']
    end
  end

  def get_detailed_pokemon_data(limit=100000)
    print "Fetched:"
    @pokemon_urls.each do |url|
      if @pokemon_data.length == limit
        break
      end
      print " "
      pokemon_data = get_data(url)
      @pokemon_data << pokemon_data
      print pokemon_data['name'] + '...'
    end
  end

  # Remove Move versioning and ID indicies data.
  def prune_pokemon_data(dataset)
    pruned_data = dataset
    pruned_data['moves'] = pruned_data['moves'].map do |move|
      move = move['move']
    end
    pruned_data.delete('game_indices')
    pruned_data
  end

  def make_pokemon_data
    @pokemon_data.each do |data|
      id = data['id']
      name = data['name']
      pruned_data = prune_pokemon_data(data)
      pokemon = Pokemon.new(id, name)
      PokemonJson.new(pokemon, pruned_data)
    end
  end

  def make_pokemon_type_data
    @pokemon_data.each do |pokemon_data|
      elements = pokemon_data['types'].map do |type_data|
        ElementType.get_type_by_name(type_data['type']['name'])
      end

      pokemon = Pokemon.find_pokemon_by_name(pokemon_data['name'])
      puts "Assigning types to " + pokemon.name
      elements.each do |element|
        PokemonType.new(pokemon, element)
      end
    end
  end

  def make_available_moves
    @pokemon_data.each do |pokemon_data|
      pokemon = Pokemon.find_pokemon_by_name(pokemon_data['name'])
      puts 'Assigning moves to ' + pokemon.name
      pokemon_data['moves'].each do |move_data|
        # binding.pry
        move_name = move_data['name']
        move = Move.find_move_by_name(move_name)
        AvailableMove.new(pokemon, move)
      end
    end
  end

  def get_data(link)
    JSON.parse(RestClient.get(link))
  end

end
