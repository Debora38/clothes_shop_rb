require 'shop'

RSpec.describe 'features' do
  it "should allow a user to complete a full journey on our website" do
    shop = Shop.new
    shop.create_category('womensfootwear')
    shop.create_category('womenscasualwear')
    womensfootwear = shop.categories[0]
    womenscasualwear = shop.categories[1]
    womensfootwear.create_item('Almond Toe Court Shoes, Patent Black', 99, 5)
    shoes = womensfootwear.items[0]
    womenscasualwear.create_item('Cotton Shorts, Medium Red', 30, 5)
    shorts = womenscasualwear.items[0]
    voucher_five = shop.create_voucher(5, 'voucher5')
    voucher_ten = shop.create_voucher(10, 'voucher10')
    voucher_fifteen = shop.create_voucher(15, 'voucher15')
    shop.shopping_cart.add_to_cart(shoes)
    expect(shop.shopping_cart.items_in_cart).to include(shoes)
    expect(shop.shopping_cart.total_cost). to eq 99
    shop.shopping_cart.remove_item_from_cart(shoes)
    expect(shop.shopping_cart.total_cost). to eq 0
    shop.shopping_cart.add_to_cart(shoes)
    shop.shopping_cart.add_to_cart(shoes)
    expect(shoes.availability).to eq 3
    shop.shopping_cart.add_to_cart(shoes)
    shop.shopping_cart.add_to_cart(shoes)
    shop.shopping_cart.add_to_cart(shoes)
    expect { shop.shopping_cart.add_to_cart(shoes) }.to raise_error('No availability')
    expect(shop.shopping_cart.total_cost). to eq 495
    expect(shoes.availability).to eq 0
    shop.shopping_cart.remove_item_from_cart(shoes)
    expect(shoes.availability).to eq 1
    shop.shopping_cart.apply_voucher('voucher15')
    expect(shop.shopping_cart.total_cost).to eq 381
    expect { shop.shopping_cart.apply_voucher('voucher10') }.to raise_error 'A voucher is already applied'
    shop.shopping_cart.remove_item_from_cart(shoes)
    shop.shopping_cart.remove_item_from_cart(shoes)
    shop.shopping_cart.remove_item_from_cart(shoes)
    shop.shopping_cart.remove_item_from_cart(shoes)
    shop.shopping_cart.add_to_cart(shorts)
    expect(shop.shopping_cart.total_cost).to eq 30
    expect(shop.shopping_cart.vouchers_applied.length).to eq 0
    expect { shop.shopping_cart.apply_voucher('voucher15') }.to raise_error 'Invalid voucher or cart criteria'
    expect { shop.shopping_cart.apply_voucher('voucher10') }.to raise_error 'Invalid voucher or cart criteria'
    shop.shopping_cart.apply_voucher('voucher5')
    expect(shop.shopping_cart.total_cost).to eq 25
    expect { shop.shopping_cart.apply_voucher('voucher5') }.to raise_error 'A voucher is already applied'
  end
end
