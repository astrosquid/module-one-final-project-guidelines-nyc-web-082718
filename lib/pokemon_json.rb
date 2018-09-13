class PokemonJson < ActiveRecord::Base
  belongs_to :pokemon 
end

# belongs_to pokemon
# integer pokemon_id
# string json_data
