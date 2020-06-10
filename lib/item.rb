class Item

  attr_reader :name, :price

  def initialize(argument)
    @name = argument[:name]
    @price = argument[:price]
  end
end
