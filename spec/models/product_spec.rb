require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    # validates all attributes, presence: true
    it "is valid with all attributes" do
      @category = Category.create
      @product = Product.create( 
        name: "Frank Rose",
        price: 42,
        quantity: 13,
        category: @category
      )
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    # validates :name, presence: true
    it "is invalid without a name" do
      @category = Category.create
      @product = Product.create( 
        name: nil,
        price: 42,
        quantity: 13,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # validates :price, presence: true
    it "is invalid without a price" do
      @category = Category.create
      @product = Product.create( 
        name: "Frank Rose",
        price: nil,
        quantity: 13,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # validates :quantity, presence: true
    it "is invalid without a quantity" do
      @category = Category.create
      @product = Product.create( 
        name: "Frank Rose",
        price: 42,
        quantity: nil,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    # validates :category, presence: true
    it "is invalid without a category" do
      @product = Product.create( 
        name: "Frank Rose",
        price: 42,
        quantity: 13,
        category: nil
      )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end


  # Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
  # Create an initial example that ensures that a product with all four fields set will indeed save successfully
  # Have one example for each validation, and for each of these:
    # Set all fields to a value but the validation field being tested to nil
    # Test that the expect error is found within the .errors.full_messages array
  # You should therefore have five examples defined given that you have the four validations above