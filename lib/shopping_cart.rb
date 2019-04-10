class Shopping_cart
  attr_reader :items_in_cart, :total_cost

  def initialize
    @items_in_cart = Array.new
    @total_cost = 0
  end

  def add_to_cart(item)
    @items_in_cart << item
    @total_cost += item.price
  end

  def remove_item_from_cart(item)
    @items_in_cart.delete(item)
  end
end
