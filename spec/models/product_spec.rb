require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates that of the product does save" do
      @category = Category.new
      @product = Product.new(:name => "Psyduck", :price => 5, :quantity => 1, :category => @category)
      @product.save
      expect(@product.name).to eq("Psyduck")
      expect(@product.price).to eq(5)
      expect(@product.quantity).to be(1)
      expect(@product.category).to be(@category)
    end
    it "throw an error if name is missing" do
      @category = Category.new
      @product = Product.new(:name => nil, :price => 5, :quantity => 1, :category => @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "throw an error if price is missing" do
      @category = Category.new
      @product = Product.new(:name => "Psyduck", :price => nil, :quantity => 1, :category => @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "throw an error if quantity is missing" do
      @category = Category.new
      @product = Product.new(:name => "Psyduck", :price => 5, :quantity => nil, :category => @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "throw an error if category is missing" do
      @category = Category.new
      @product = Product.new(:name => "Psyduck", :price => 5, :quantity => 1, :category => nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
