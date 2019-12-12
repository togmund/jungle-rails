class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: Rails.configuration.admin_auth[:username], password: Rails.configuration.admin_auth[:password]

  def show
    @product_count       = Product.all.length
    puts @product_count
    @category_count      = Category.all.length
    puts @category_count
  end

end
