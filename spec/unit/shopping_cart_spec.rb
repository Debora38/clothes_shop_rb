require 'shopping_cart'

RSpec.describe Shopping_cart do
  it "should add items to the cart" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4)
    subject.add_to_cart(shoes)
    expect(subject.items_in_cart[0].name).to eq 'shoes'
  end

  it "should remove an item from the cart" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4)
    subject.add_to_cart(shoes)
    subject.remove_item_from_cart(shoes)
    expect(subject.items_in_cart).to eq []
  end

  it "should show the total of the shopping cart" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4)
    subject.add_to_cart(shoes)
    expect(subject.total_cost).to eq 99
  end

  it "should show the new total, when items are removed" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4)
    subject.add_to_cart(shoes)
    subject.add_to_cart(shoes)
    expect(subject.total_cost).to eq 198
    subject.remove_item_from_cart(shoes)
    expect(subject.total_cost).to eq 99
  end

  it "should not allow to add more items than available" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 0)
    expect { subject.add_to_cart(shoes) }.to raise_error('No availability')
  end

  it "should update the total cost of the cart when a voucher is applied" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4)
    voucher = double('voucher', :amount => 5)
    subject.add_to_cart(shoes)
    subject.apply_voucher(voucher)
    expect(subject.total_cost).to eq 94
  end

  it "should not apply more than 1 voucher" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4)
    voucher = double('voucher', :amount => 5)
    subject.add_to_cart(shoes)
    subject.apply_voucher(voucher)
    expect { subject.apply_voucher(voucher) }.to raise_error('Voucher already applied')
    expect(subject.total_cost).to eq 94
  end
end
