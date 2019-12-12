class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: Rails.configuration.admin_auth[:username], password: Rails.configuration.admin_auth[:password]

  def index
    @categories = Categories.order(id: :desc).all
  end

end
