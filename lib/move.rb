class Move < ActiveRecord::Base
  has_many :available_moves
  belongs_to :element_type
  has_many :pokemons, through: :available_moves
end
