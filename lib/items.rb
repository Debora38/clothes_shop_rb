class Items
  attr_reader :name
  attr_accessor :price, :availability

  def initialize(name, price, availability)
    @name = name
    @price = price
    @availability = availability
  end
end
