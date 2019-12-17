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

    it "is invalid when the password is too short" do
      @user = User.create(
        first_name: "Frank",
        last_name: "Rose",
        email: "frank@rose.com",
        password: "pass",
        password_confirmation: "pass"
      )
      expect(@user.errors.full_messages)
        .to include("Password is too short (minimum is 6 characters)")
    end

    it "is invalid when email is not unique" do
      @firstUser = User.create(
        first_name: "Joe",
        last_name: "Blow",
        email: "used@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user = User.create(
        first_name: "Frank",
        last_name: "Rose",
        email: "usEd@eMail.cOm",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user.errors.full_messages)
        .to include("Email has already been taken")
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

  describe '.authenticate_with_credentials' do

    it "is invalid when the password is invalid" do
    @user = User.create(
      first_name: "Frank",
      last_name: "Oak",
      email: "used@email.com",
      password: "password",
      password_confirmation: "password"
    )
    @user.authenticate_with_credentials("used@email.com","albatross")
    expect(@user.errors.full_messages)
      .to include("Last name can't be blank")
    end
  end

end