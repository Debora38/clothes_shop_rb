require 'shop'

RSpec.describe 'features' do
  it "should allow a user to complete a full journey on our website" do
    shop = Shop.new
    shop.create_category('womensfootwear')
    womensfootwear = shop.categories[0]
    womensfootwear.create_item('Almond Toe Court Shoes, Patent Black', 99, 5)
    shoes = womensfootwear.items[0]
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
  end
end
