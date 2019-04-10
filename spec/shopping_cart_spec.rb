require 'shopping_cart'

RSpec.describe Shopping_cart do
  it "should add items to the cart" do
    shoes = double('shoes')
    allow(shoes).to receive(:name).and_return('shoes')
    subject.add_item(shoes)
    expect(subject.items_in_cart[0].name).to eq 'shoes'
  end
end
