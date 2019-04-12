class Shopping_cart
  attr_reader :items_in_cart, :total_cost, :vouchers_applied
  attr_accessor :available_vouchers

  def initialize
    @items_in_cart = Array.new
    @total_cost = 0
    @available_vouchers = Array.new
    @vouchers_applied = Array.new
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
    remove_item(item)
    item.availability += 1
    check_criteria_for_any_voucher
    @total_cost -= item.price
  end

  def apply_voucher(code)
    if @vouchers_applied.length > 0
      raise 'A voucher is already applied'
    elsif (find_valid_voucher(code) != nil) && valid_cart_criteria?
      apply_discount
    else
      raise 'Invalid voucher or cart criteria'
    end
  end

  private

  def remove_item(item)
    @items_in_cart.slice!(@items_in_cart.index(item))
  end

  def apply_discount
    @total_cost -= @voucher.amount
    check_total_cost
    @vouchers_applied << @voucher
  end

  def find_valid_voucher(code)
    @voucher = @available_vouchers.select {|available_voucher|
      available_voucher.code == code
    }.first
  end

  def valid_cart_criteria?
    @voucher.amount == 5 ||
    @voucher.amount == 10 && @total_cost > 50 ||
    @voucher.amount == 15 && @total_cost > 75 && one_footwear_item?
  end

  def one_footwear_item?
    @items_in_cart.any? { |item|
      item.category == 'womensfootwear' || item.category == 'mensfootwear'
    }
  end

  def check_total_cost
    @total_cost = 0 if @total_cost < 0
  end

  def check_criteria_for_any_voucher
    if @vouchers_applied.length > 0
      @voucher = @vouchers_applied.first
      remove_voucher if !valid_cart_criteria?
    end
  end

  def remove_voucher
    @vouchers_applied.clear
    @total_cost += @voucher.amount
  end
end
