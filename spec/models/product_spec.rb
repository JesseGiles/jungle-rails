require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves succesfully  with all four fields set" do
      @category = Category.new(name: "Flytrap")

      @category.save

      @testproduct = Product.new(name: "Audrey II", price_cents: 6000, quantity: 1, category: @category)

      @testproduct.save

      expect(@testproduct).to be_valid
    end

    it 'validates that a name value must exist for a product' do
      @category = Category.new(name: "Flytrap")

      @category.save

      @testproduct = Product.new(name: nil, price_cents: 6000, quantity: 1, category: @category)

      @testproduct.save

      expect(@testproduct).not_to be_valid
    end

    it 'validates that a price value must exist for a product' do
      @category = Category.new(name: "Flytrap")

      @category.save

      @testproduct = Product.new(name: "Audrey II", price_cents: nil, quantity: 1, category: @category)

      @testproduct.save

      expect(@testproduct).not_to be_valid
    end

    it 'validates that a quantity value must exist for a product' do
      @category = Category.new(name: "Flytrap")

      @category.save

      @testproduct = Product.new(name: "Audrey II", price_cents: 6000, quantity: nil, category: @category)

      @testproduct.save

      expect(@testproduct).not_to be_valid
    end

    it 'validates that a category value must exist for a product' do
      @category = Category.new(name: "Flytrap")

      @category.save

      @testproduct = Product.new(name: nil, price_cents: 6000, quantity: 1, category: nil)

      @testproduct.save

      expect(@testproduct).not_to be_valid
    end


  end
end
