class Pokemon < ActiveRecord::Base
  has_many :available_moves
  has_many :pokemon_types
  has_many :moves, through: :available_moves
  has_many :element_types, through: :pokemon_types

  def self.get_number_of_available_moves
    hash = {}
    AvailableMove.all.each do |avail_move|
      if hash[avail_move.move_id]
        hash[avail_move.move_id] += 1
      else
        hash[avail_move.move_id] = 1
      end
    end
    # binding.pry
    hash
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
