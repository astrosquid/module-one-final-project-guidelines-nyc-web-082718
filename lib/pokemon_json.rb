class PokemonJson
  @@all = []
  
  attr_reader :pokemon, :json_data

  def initialize(pokemon, json_data)
    @pokemon = pokemon
    @json_data = json_data
    @@all << self
  end
end

# belongs_to pokemon
# integer pokemon_id
# string json_data
