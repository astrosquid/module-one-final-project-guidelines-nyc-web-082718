class PokemonType

  @@all = []

  attr_reader :pokemon, :element_type

  def initialize(pokemon, element_type)
    @pokemon = pokemon
    @element_type = element_type
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_pokemon_types_by_pokemon(pokemon)
    @@all.find_all do |pokemon_type|
      pokemon_type.pokemon == pokemon
    end
  end

  def to_s
    self.element_type.name
  end
end
