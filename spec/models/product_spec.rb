require 'rails_helper'

RSpec.describe Product, type: :model do
  mockProduct = Product.new
  
  describe 'Validations' do
    # validates all attributes, presence: true
    it "is valid with all valid attributes" do
      # expect(Product.new(name:,price:,quantity:,category:)).to be_valid
    end

    # validates :name, presence: true
    it "is valid with a name" do
    mockProduct.name = "Frank Rose"
    expect(mockProduct).to be_valid
    end

    # validates :price, presence: true
    it "is valid with a price" do
    mockProduct.price = 42
    expect(mockProduct).to be_valid
    end

    # validates :quantity, presence: true
    it "is valid with a quantity" do
    mockProduct.quantity = 13
    expect(mockProduct).to be_valid
    end

    # validates :category, presence: true
    it "is valid with a category" do
    mockProduct.category = 1
    expect(mockProduct).to be_valid
    end

  end
end


  # Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
  # Create an initial example that ensures that a product with all four fields set will indeed save successfully
  # Have one example for each validation, and for each of these:
    # Set all fields to a value but the validation field being tested to nil
    # Test that the expect error is found within the .errors.full_messages array
  # You should therefore have five examples defined given that you have the four validations above