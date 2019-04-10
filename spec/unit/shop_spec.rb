require 'shop'

RSpec.describe Shop do
  it "should create a category" do
    subject.create_category('Womenswear')
    expect(subject.categories[0].name).to eq 'Womenswear'
  end

  it "should create a voucher" do
    subject.create_voucher(5)
    expect(subject.vouchers[0].amount).to eq 5
  end
end
