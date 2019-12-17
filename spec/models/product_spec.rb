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
      # Alternate syntax:
      # expect(@product).to have(1).error_on(:name)
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
