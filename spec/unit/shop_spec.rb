require 'shop'

RSpec.describe Shop do
  it "should add a category" do
    subject.create_category('Womenswear')
    expect(subject.categories[0].name).to eq 'Womenswear'
  end
end
