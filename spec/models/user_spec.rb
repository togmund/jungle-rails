require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validates all attributes, presence: true
    it "is valid when all attributes are present" do
      @user = User.create(
        name: "Frank Rose",
        email: "frank@rose.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end
    # validates :password, presence: true
    it "is invalid without a password" do
      @user = User.create(
        name: "Frank Rose",
        email: "frank@rose.com",
        password: nil,
        password_confirmation: "password"
      )
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    # validates :password_confirmation, presence: true
    it "is invalid without a password confirmation" do
      @user = User.create(
        name: "Frank Rose",
        email: "frank@rose.com",
        password: "password",
        password_confirmation: nil
      )
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "is invalid when the password and password confirmation do not match" do
      @user = User.create(
        name: "Frank Rose",
        email: "frank@rose.com",
        password: "password",
        password_confirmation: "albatross"
      )
      expect(@user.errors.full_messages)
        .to include("Password confirmation doesn't match Password")
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