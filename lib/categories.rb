require_relative 'items'

class Categories
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = Array.new
  end

  def add(name, price, availability)
    new_item = Items.new(name, price, availability)
    @items << new_item
  end
end
