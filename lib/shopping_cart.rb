class Shopping_cart
  attr_reader :items_in_cart, :total_cost
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
    @items_in_cart.delete(item)
    @total_cost -= item.price
    item.availability += 1
  end

  def apply_voucher(code)
    if @vouchers_applied.length > 0
      raise 'A voucher is already applied'
    else
      if find_valid_voucher(code)
        apply_discount(code)
      else
        raise 'Invalid voucher'
      end
    end
    check_total_cost
  end

  def check_total_cost
    @total_cost = 0 if @total_cost < 0
  end

  def apply_discount(code)
    find_valid_voucher(code)
    @vouchers_applied << @voucher
    @total_cost -= @voucher.amount
  end

  def find_valid_voucher(code)
    @voucher = @available_vouchers.select {|available_voucher|
      available_voucher.code == code
    }.first
  end
end
