require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates every fields" do
      @user = User.new(:first name => "Psyduck", )
    end
    it "verify that a password with an unmatched comfirmation throws and error" do
    @user= User.new()
    end
  end
end
