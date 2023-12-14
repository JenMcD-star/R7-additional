require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product name" do
    subject.product_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product count" do
    subject.product_count = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an associated customer" do
    subject.customer = nil
    expect(subject).to_not be_valid
  end
  it "is invalid if product name contains integers" do
    subject.product_name = "gears123"
    expect(subject).to_not be_valid
  end
  it "is valid if the product count is all digits" do 
    subject.product_count = 12
    expect(subject.product_count.to_s).to match(/\A\d+\z/)
  end
  it "is invalid with non-integer or negative numbers in product count" do
    ['a string', -1].each do |invalid_product_count|
      subject.product_count = invalid_product_count
      expect(subject).to_not be_valid
    end
  end
  it "belongs to a customer" do
    expect(subject).to respond_to(:customer)
  end

  it "is valid if product_name is not greater than 30 char" do
    subject.product_name = "x" * 30 
    expect(subject).to be_valid
  end
end