class Items
  attr_reader :name, :category
  attr_accessor :price, :availability

  def initialize(name, price, availability, category)
    @name = name
    @price = price
    @availability = availability
    @category = category
  end
end
