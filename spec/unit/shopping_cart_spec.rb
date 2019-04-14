require 'shopping_cart'

RSpec.describe Shopping_cart do
  it "should add items to the cart" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
    subject.add_to_cart(shoes)
    expect(subject.items_in_cart[0].name).to eq 'shoes'
  end

  it "should remove an item from the cart" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
    subject.add_to_cart(shoes)
    subject.remove_item_from_cart(shoes)
    expect(subject.items_in_cart).to eq []
  end

  it "should show the total of the shopping cart" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
    subject.add_to_cart(shoes)
    expect(subject.total_cost).to eq 99
  end

  it "should show the new total, when items are removed" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
    subject.add_to_cart(shoes)
    subject.add_to_cart(shoes)
    expect(subject.total_cost).to eq 198
    subject.remove_item_from_cart(shoes)
    expect(subject.total_cost).to eq 99
  end

  it "should not allow to add more items than available" do
    shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 0, category: 'womensfootwear')
    expect { subject.add_to_cart(shoes) }.to raise_error('No availability')
  end

  context "#apply_voucher" do
    it "should update the total cost of the cart when a £5 voucher is applied" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
      voucher = double('voucher', :amount => 5, :code => 'voucher5')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      subject.apply_voucher('voucher5')
      expect(subject.total_cost).to eq 94
    end

    it "should not return a total cost lower than 0 when a voucher is applied" do
      item = double('item', :name => 'item', :price => 4, :availability => 5, :availability= => 4, category: 'womensfootwear')
      voucher = double('voucher', :amount => 5, :code => 'voucher5')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(item)
      expect { subject.apply_voucher('voucher5') }.to raise_error('Invalid voucher or cart criteria')
      expect(subject.total_cost).to eq 4
    end

    it "should not apply more than 1 voucher" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
      voucher = double('voucher', :amount => 5, :code => 'voucher5')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      subject.apply_voucher('voucher5')
      expect { subject.apply_voucher('voucher5') }.to raise_error('A voucher is already applied')
      expect(subject.total_cost).to eq 94
    end

    it "should raise an error when an invalid voucher is applied" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
      voucher = double('voucher', :amount => 5, :code => 'voucher5')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      expect { subject.apply_voucher('voucher3') }.to raise_error('Invalid voucher or cart criteria')
    end

    it "should apply £10 off with voucher10 if when total cost is > 50" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, category: 'womensfootwear')
      voucher = double('voucher', :amount => 10, :code => 'voucher10')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      subject.apply_voucher('voucher10')
      expect(subject.total_cost).to eq 89
    end

    it "should not apply a voucher10 when the total cost is < 50" do
      shoes = double('shoes', :name => 'shoes', :price => 49, :availability => 5, :availability= => 4, category: 'womensfootwear')
      voucher = double('voucher', :amount => 10, :code => 'voucher10')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      expect { subject.apply_voucher('voucher10') }.to raise_error('Invalid voucher or cart criteria')
      expect(subject.total_cost).to eq 49
    end

    it "should apply £15 off with voucher15 if when total cost is > 75 && I bought one footwear item" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, :category => 'womensfootwear')
      voucher = double('voucher', :amount => 15, :code => 'voucher15')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      subject.apply_voucher('voucher15')
      expect(subject.total_cost).to eq 84
    end

    it "should not apply £15 off with voucher15 if when total cost is < 75" do
      shoes = double('shoes', :name => 'shoes', :price => 49, :availability => 5, :availability= => 4, :category => 'womensfootwear')
      voucher = double('voucher', :amount => 15, :code => 'voucher15')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      expect { subject.apply_voucher('voucher15') }.to raise_error('Invalid voucher or cart criteria')
      expect(subject.total_cost).to eq 49
    end

    it "should not apply £15 off with voucher15 if when I'm not buying one footwear item" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, :category => 'womenswear')
      voucher = double('voucher', :amount => 15, :code => 'voucher15')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      expect { subject.apply_voucher('voucher15') }.to raise_error('Invalid voucher or cart criteria')
      expect(subject.total_cost).to eq 99
    end

    it "should remove a voucher if an item is removed from the cart and the criteria do not meet anymore" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, :category => 'womensfootwear')
      item = double('item', :name => 'item', :price => 15, :availability => 5, :availability= => 4, category: 'womenswear')
      voucher = double('voucher', :amount => 15, :code => 'voucher15')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      subject.add_to_cart(item)
      subject.apply_voucher('voucher15')
      subject.remove_item_from_cart(shoes)
      expect(subject.vouchers_applied.length).to eq 0
      expect(subject.total_cost).to eq 15
    end

    it "should leave a voucher if an item is removed from the cart but the criteria still meet" do
      shoes = double('shoes', :name => 'shoes', :price => 99, :availability => 5, :availability= => 4, :category => 'womensfootwear')
      item = double('item', :name => 'item', :price => 15, :availability => 5, :availability= => 4, category: 'womenswear')
      voucher = double('voucher', :amount => 15, :code => 'voucher15')
      subject.available_vouchers.push(voucher)
      subject.add_to_cart(shoes)
      subject.add_to_cart(item)
      subject.apply_voucher('voucher15')
      subject.remove_item_from_cart(item)
      expect(subject.vouchers_applied.length).to eq 1
      expect(subject.total_cost).to eq 84
    end
  end
end
