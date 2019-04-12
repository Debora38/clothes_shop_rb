require_relative 'categories'
require_relative 'shopping_cart'
require_relative 'vouchers'

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

  def create_voucher(amount, code)
    new_voucher = Vouchers.new(amount, code)
    @shopping_cart.available_vouchers << new_voucher
  end
end
