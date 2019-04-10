class Shopping_cart
  attr_reader :items_in_cart, :total_cost

  def initialize
    @items_in_cart = Array.new
    @total_cost = 0
  end

  def add_to_cart(item)
    if item.availability >= 1
      @items_in_cart << item
      item.availability -= 1
      @total_cost += item.price
    else
      raise 'No availability'
    end
  end

  def remove_item_from_cart(item)
    @items_in_cart.delete(item)
    @total_cost -= item.price
    item.availability += 1
  end
end
