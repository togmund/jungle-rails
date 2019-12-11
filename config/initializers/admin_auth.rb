Rails.configuration.admin_auth = {
  :username      => ENV['ADMIN_USERNAME'],
  :password      => ENV['ADMIN_PASSWORD']
}

Rails.configuration.admin_auth[:username]
Rails.configuration.admin_auth[:password]