class ElementType
  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_type_by_name(name)
    @@all.find do |element|
      element.name == name 
    end
  end
end
