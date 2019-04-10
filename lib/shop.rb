require_relative 'categories'
require_relative 'shopping_cart'

class Shop

  attr_reader :categories, :shopping_cart

  def initialize
    @categories = Array.new
    @shopping_cart = Shopping_cart.new
  end

  def create_category(category_name)
    new_category = Categories.new(category_name)
    @categories << new_category
  end
end
