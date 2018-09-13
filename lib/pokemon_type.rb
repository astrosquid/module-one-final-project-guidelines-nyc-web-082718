class PokemonType < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :element_type
end
