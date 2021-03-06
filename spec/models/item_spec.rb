require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    end
  
  describe "商品登録" do
    context "商品登録がうまくいく時" do
      it "image,name,name,explanation,categoly_id,state_id,delivery_fee_id,prefecture_id,day_id,priceがあれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品登録がうまくいかないとき" do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "categoryが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "stateが空では登録できない" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "delivery_feeが空では登録できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "prefectureが空では登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "dayが空では登録できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "categoryが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "stateが1では登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "delivery_feeが1では登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "prefectureが1では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "dayが1では登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が半角でないときは登録できない" do
        @item.price = "３３３３".to_i
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "販売価格が¥299以下のときは登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "販売価格が¥10000000以上のときは登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "priceは半角英数混合では登録できない" do
        @item.price = "abc123".to_i
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "priceは半角英語だけでは登録できない" do
        @item.price = "abcabc".to_i
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
    end
  end   
end