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

# Write a new feature spec that will test that users can navigate from the home page to the product detail page by clicking on a product.


# scenario "Filter all bikes by model" do
#   visit "/bicycles"

#   fill_in "model", with: @bike1.model
#   click_button("Search!")
#   save_screenshot("filtered_by_model.png")

#   expect(page).to have_css("div.bicycle", count: 1)
#   expect(page).to have_text(@bike1.description)
# end
