class Trainer

  attr_accessor :pokemon
  attr_reader :name

  def initialize(name)
    @name = name
    @pokemon = []
  end

end
