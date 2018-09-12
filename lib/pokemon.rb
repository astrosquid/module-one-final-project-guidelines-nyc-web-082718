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

  def to_s
    "No. #{@id}: #{@name}"
  end
end
