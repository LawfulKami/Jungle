require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "verify every fields" do
      @user = User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => "psychic@attack.com", :password => "Misty", :password_confirmation => "Misty")
      @user.save
      expect(@user.first_name).to eq("Psyduck")
      expect(@user.last_name).to eq("Water-Type")
      expect(@user.email).to eq("psychic@attack.com")
      expect(@user.password).to eq("Misty")
      expect(@user.password_confirmation).to eq("Misty")
    end

    it "Confirm that error occurs when first name is missing" do
    @user= User.new(:first_name => nil, :last_name => "Water-Type", :email => "psychic@attack.com", :password => "Misty", :password_confirmation => "Misty")
    @user.save
    expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "Confirm that error occurs when last name is missing" do
      @user= User.new(:first_name => "Psyduck", :last_name => nil, :email => "psychic@attack.com", :password => "Misty", :password_confirmation => "Misty")
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "Confirm that error occurs when email is missing" do
      @user= User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => nil, :password => "Misty", :password_confirmation => "Misty")
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "Confirm that error occurs when password is missing" do
      @user= User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => "psychic@attack.com", :password => nil, :password_confirmation => "Misty")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "Confirm that error occurs when password confirmation is missing" do
      @user= User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => "psychic@attack.com", :password => "Misty", :password_confirmation => nil)
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end

  describe "Email and Password verification" do
    it "Verify error thrown if email already exist in database" do
      @user = User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => "psychic@attack.com", :password => "Misty", :password_confirmation => "Misty")
      @user.save
      @new_user = User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => "psychic@attack.com", :password => "Misty", :password_confirmation => "Misty")
      @new_user.save
      expect(@new_user.errors.full_messages).to include("Email has already been taken")
    end

    it "Verify error thrown if password and password confirmation don't match" do
      @user = User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => "psychic@attack.com", :password => "Misty", :password_confirmation => "sty")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "Verify error thrown if password is shorter tha 5 characters" do
      @user = User.new(:first_name => "Psyduck", :last_name => "Water-Type", :email => "psychic@attack.com", :password => "psy", :password_confirmation => "psy")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end
end
