require 'shopping_cart'

RSpec.describe Shopping_cart do
  it "should add items to the cart" do
    shoes = double('shoes', :name => 'shoes', :price => 99)
    subject.add_to_cart(shoes)
    expect(subject.items_in_cart[0].name).to eq 'shoes'
  end

  it "should remove an item from the cart" do
    shoes = double('shoes', :price => 99)
    subject.add_to_cart(shoes)
    subject.remove_item_from_cart(shoes)
    expect(subject.items_in_cart).to eq []
  end

  it "should show the total of the shopping cart" do
    shoes = double('shoes', :price => 99)
    subject.add_to_cart(shoes)
    expect(subject.total_cost).to eq 99
  end

  it "should show the new total, when items are removed" do
    shoes = double('shoes', :price => 99)
    subject.add_to_cart(shoes)
    subject.add_to_cart(shoes)
    expect(subject.total_cost).to eq 198
    subject.remove_item_from_cart(shoes)
    expect(subject.total_cost).to eq 99
  end
end
