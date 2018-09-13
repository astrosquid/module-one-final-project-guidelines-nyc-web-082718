class Move < ActiveRecord::Base
  has_many :available_moves
  belongs_to :element_type
  has_many :pokemons, through: :available_moves

  def self.all_pokemon_for_specific_move(move_name)
    move = Move.find_by(name: move_name)
    move.pokemons
  end

end
