require 'categories'

RSpec.describe Categories do
  it "should add items to the category" do
    womensfootwear = Categories.new("womensfootwear")
    womensfootwear.create_item("Almond Toe Court Shoes, Patent Black", 99, 5)
    expect(womensfootwear.items[0].name).to eq "Almond Toe Court Shoes, Patent Black"
    expect(womensfootwear.items[0].price).to eq 99
    expect(womensfootwear.items[0].availability).to eq 5
  end
end
