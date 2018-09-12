class Move
  @@all = []

  attr_reader :name, :element_type, :url

  def initialize(name, element_type, url)
    @name = name
    @element_type = element_type
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_move_by_name(name)
    @@all.find do |move|
      move.name == name
    end
  end
end
