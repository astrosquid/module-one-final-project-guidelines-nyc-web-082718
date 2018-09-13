class Pokemon < ActiveRecord::Base
  has_many :available_moves
  has_many :pokemon_types
  has_many :moves, through: :available_moves
  has_many :element_types, through: :pokemon_types
end
