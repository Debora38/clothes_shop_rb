class Items
  attr_reader :name, :price, :availability

  def initialize(name, price, availability)
    @name = name
    @price = price
    @availability = availability
  end
end
