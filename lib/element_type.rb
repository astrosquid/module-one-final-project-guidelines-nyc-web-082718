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
    binding.pry
    element_type_counts
  end


  def self.most_popular_element_type
    ElementType.get_number_of_element_types
    most_popular = 0


  end

end
