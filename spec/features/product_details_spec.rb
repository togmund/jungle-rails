require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "They see all details" do
    # ACT
    visit root_path
    find('header a').hover.click

    # DEBUG
    save_screenshot("product_details.png")

    # VERIFY
    expect(page).to have_text(@product1.description)
  end
end