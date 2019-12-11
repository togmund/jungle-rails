class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: Rails.configuration.admin_auth[:username], password: Rails.configuration.admin_auth[:password]

  def show
  end
end
