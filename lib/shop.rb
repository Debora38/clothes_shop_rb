require_relative 'categories'

class Shop

  attr_reader :categories

  def initialize
    @categories = Array.new
  end

  def add(category_name)
    new_category = Categories.new(category_name)
    @categories << new_category
  end
end
