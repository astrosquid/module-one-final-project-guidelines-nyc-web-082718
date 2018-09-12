class Pokemon

  @@all = []

  attr_reader :id, :name, :url

  def initialize(id, name, url)
    @id = id
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all=(array)
    @@all = array
  end

  def self.find_pokemon_by_name(name)
    @@all.find do |pokemon|
      pokemon.name == name
    end 
  end

  def to_s
    "No. #{@id}: #{@name}"
  end
end
