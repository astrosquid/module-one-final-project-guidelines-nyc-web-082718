class AvailableMove
  @@all = []

  attr_reader :pokemon, :move

  def initialize(pokemon, move)
    @pokemon = pokemon
    @move = move
    @@all << self 
  end

  def self.all
    @@all
  end
end
