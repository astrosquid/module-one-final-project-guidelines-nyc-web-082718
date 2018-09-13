class ElementType < ActiveRecord::Base
  has_many :moves
  has_many :pokemon_types
  has_many :pokemons, through: :pokemon_types
end
