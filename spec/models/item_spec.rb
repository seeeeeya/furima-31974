require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品作成' do
    it "imageが空だと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank", "User must exist")
    end
    it "nameが空だと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank", "User must exist")
    end
    it "description_of_itemが空だと出品できない" do
      @item.description_of_item = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description of item can't be blank", "User must exist")
    end
    it "category_idを選択しないと出品できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1", "User must exist")
    end
    it "product_condition_idを選択しないと出品できない" do
      @item.product_condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition must be other than 1", "User must exist")
    end
    it "shipping_charges_idを選択しないと出品できない" do
      @item.shipping_charges_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must be other than 1", "User must exist")
    end
    it "prefectures_idを選択しないと出品できない" do
      @item.prefectures_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures must be other than 1", "User must exist")
    end
    it "days_to_ship_idを選択しないと出品できない" do
      @item.days_to_ship_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1", "User must exist")
    end
    it "priceが空だと出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price 半角数字のみ使えます", "User must exist")
    end
    it "priceが全角数字だと出品できない" do
      @item.price = "２０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number", "User must exist")
    end
  end
end
