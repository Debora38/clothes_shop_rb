class Shopping_cart
  attr_reader :items_in_cart

  def initialize
    @items_in_cart = Array.new
  end

  def add_to_cart(item)
    @items_in_cart << item
  end
end
