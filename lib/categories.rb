require_relative 'items'

class Categories
  attr_reader :category_name, :items

  def initialize(category_name)
    @category_name = category_name
    @items = Array.new
  end

  def create_item(name, price, availability)
    new_item = Items.new(name, price, availability, @category_name)
    @items << new_item
  end
end
