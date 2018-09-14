class ElementType < ActiveRecord::Base
  has_many :moves
  has_many :pokemon_types
  has_many :pokemons, through: :pokemon_types


  def self.get_number_of_element_types
    element_type_counts = {}
    ElementType.all.each do |element_type|
      assignments = PokemonType.where(element_type: element_type)
      element_type_counts[element_type] = assignments.length
    end
    element_type_counts
  end


  def self.most_popular_element_type_pokemon
    highest = 0
    highest_key = 0
    ElementType.get_number_of_element_types.each do |key, value|
      if value > highest
        highest = value
        highest_key = key
      end
    end
    highest_key
  end

  def self.least_popular_element_type_pokemon
    lowest = 2000
    lowest_key = 0
    ElementType.get_number_of_element_types.each do |key, value|
      if value < lowest
        lowest = value
        lowest_key = key
      end
    end
    lowest_key
  end

  def self.get_number_of_element_types_moves
    move_element_type_counts = {}
    ElementType.all.each do |element_type|
      assignments = Move.where(element_type: element_type)
      move_element_type_counts[element_type] ||= assignments.length
    end
    move_element_type_counts
  end

  def self.most_popular_element_type_battle_move
    highest = 0
    highest_key = 0
    ElementType.get_number_of_element_types_moves.each do |key, value|
      if value > highest
        highest = value
        highest_key = key
      end
    end
    highest_key
  end

  def self.least_popular_element_type_battle_move
    lowest = 2000
    lowest_key = 0
    ElementType.get_number_of_element_types_moves.each do |key, value|
      if value <= lowest
        lowest = value
        lowest_key = key
      end
    end
    lowest_key
  end

end
