require 'rails_helper'

RSpec.feature "AddToCart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @product1 = @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

  scenario "Clicking add to an item increments the cart number" do
    # ACT
    visit root_path
    expect(page).to have_text(" My Cart (0)")
    find('button').hover.click

    # DEBUG
    save_screenshot("add_to_cart.png")

    # VERIFY
    expect(page).to have_text(" My Cart (1)")
  end
end