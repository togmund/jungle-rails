require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validates all attributes, presence: true
    it "is valid when all attributes are present" do
      @user = User.create(
        first_name: "Frank",
        last_name: "Rose",
        email: "frank@rose.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end

    it "is invalid when the password and password confirmation do not match" do
      @user = User.create(
        first_name: "Frank",
        last_name: "Rose",
        email: "frank@rose.com",
        password: "password",
        password_confirmation: "albatross"
      )
      expect(@user.errors.full_messages)
        .to include("Password confirmation doesn't match Password")
    end

    it "is invalid when email is not unique" do
      @user = User.create(
        first_name: "Frank",
        last_name: "Rose",
        email: "used@email.com",
        password: "password",
        password_confirmation: "albatross"
      )
      expect(@user.errors.full_messages)
        .to include("Password confirmation doesn't match Password")
    end

    it "is invalid when email is not present" do
      @user = User.create(
        first_name: "Frank",
        last_name: "Rose",
        email: nil,
        password: "password",
        password_confirmation: "password"
      )
      expect(@user.errors.full_messages)
        .to include("Email can't be blank")
    end

    it "is invalid when first_name is not present" do
      @user = User.create(
        first_name: nil,
        last_name: "Rose",
        email: "used@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user.errors.full_messages)
        .to include("First name can't be blank")
    end
    
    it "is invalid when last_name is not present" do
      @user = User.create(
        first_name: "Frank",
        last_name: nil,
        email: "used@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user.errors.full_messages)
        .to include("Last name can't be blank")
    end

  end

  # describe '.authenticate_with_credentials' do

  # end

end

# It must be created with a password and password_confirmation fields
#   These need to match so you should have an example for where they are not the same
#   These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required
