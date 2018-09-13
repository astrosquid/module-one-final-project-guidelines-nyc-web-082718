class Pokemon < ActiveRecord::Base
  has_many :available_moves
  has_many :pokemon_types
  has_many :moves, through: :available_moves
  has_many :element_types, through: :pokemon_types

  def self.get_number_of_available_moves
    available_move_counts = {}
    AvailableMove.all.each do |avail_move|
      if available_move_counts[avail_move.move]
        available_move_counts[avail_move.move] += 1
      else
        available_move_counts[avail_move.move] = 1
      end
    end
    available_move_counts
  end

  def self.most_common_move
    hash = Pokemon.get_number_of_available_moves
    highest = 0
    highest_id = 0
    hash.each do |key, value|
      if value > highest
        highest = value
        highest_id = key
      end
    end
    Move.find_by(id: highest_id)
  end

  def self.least_common_move
    hash = Pokemon.get_number_of_available_moves
    lowest = 803
    lowest_id = 0
    hash.each do |key, value|
      if value < lowest
        lowest = value
        lowest_id = key
      end
    end
    Move.find_by(id: lowest_id)
  end

end
