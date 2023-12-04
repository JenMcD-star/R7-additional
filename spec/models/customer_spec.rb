
require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { Customer.new(first_name: "Jack", last_name: "Smith", phone: "8889995678", email: "jsmith@sample.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 char" do
    ['123456789', '12345678910'].each do |invalid_phone_number|
      subject.phone = invalid_phone_number
      expect(subject).to_not be_valid
    end
  end
  it "is not valid if the phone number is not all digits" do 
    expect(subject.phone).to match(/\A\d+\z/)
  end
  it "is not valid if the email address doesn't have a @" do
    subject.email = "jsmithsample.com"
    expect(subject).to_not be_valid
  end
end