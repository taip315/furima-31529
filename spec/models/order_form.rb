require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
    end
  
  describe "商品購入" do
    context "商品購入がうまくいく時" do
      it "postal_number, prefecture_id, municipality, address, phone_number, token があれば登録できる" do
        expect(@order_form).to be_valid
      end
    end

    context "商品購入がうまくいかない時" do
      it "tokenが空だと商品購入ができない" do 
        @order_form.token = nil
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_numberが空だと商品購入ができない" do 
        @order_form.postal_number = nil
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Postal number can't be blank")
      end
      it "postal_numberにハイフンがないと商品購入ができない" do 
        @order_form.postal_number = "1234567"
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Postal number Input correctly")
      end
      it "postal_numberが数字でないと商品購入ができない" do 
        @order_form.postal_number = "あいうえお"
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Postal number Input correctly")
      end
      it "prefecture_idが空だと商品購入ができない" do 
        @order_form.prefecture_id = nil
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1だと商品購入ができない" do 
        @order_form.prefecture_id = 1
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Prefecture Select")
      end
      it "municipalityが空だと商品購入ができない" do 
        @order_form.municipality = nil
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空だと商品購入ができない" do 
        @order_form.address = nil
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと商品購入ができない" do 
        @order_form.phone_number = nil
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberにハイフンが入っていると商品購入ができない" do 
        @order_form.phone_number = "090-1234-5678"
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが数字以外だと商品購入ができない" do 
        @order_form.phone_number = "あいうえお"
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが11桁より大きいと商品購入ができない" do 
        @order_form.phone_number = "090123456789"
        @order_form.valid? 
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end


    end
  end
end