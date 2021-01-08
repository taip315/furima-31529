require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    
    context "ユーザー新規登録がうまくいく時" do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_furigana,last_furigana,birthdayがあれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it "emailに@が含まれていれば登録できる" do 
        @user.email = "abc@abc"
        expect(@user). to be_valid
      end
      it "first_name, last_nameが全角漢字、ひらがな、カタカナであれば登録できる" do
        @user.first_name = "田中"
        @user.last_name = "たろう"
        expect(@user). to be_valid
      end
      it "first_furigana, last_furiganaが全角カタカナであれば登録できる" do
        @user.first_furigana = "タナカ"
        @user.last_furigana = "タロウ"
        expect(@user). to be_valid
      end
      it "passwordに英字と数字の両方が含まれていれば登録できる" do
        @user.password = "abc123"
        expect(@user). to be_valid
      end
    end

    context "ユーザー新規登録がうまくいかないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_furiganaが空では登録できない" do
        @user.first_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end
      it "last_furiganaが空では登録できない" do
        @user.last_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "abc1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは英字と数字を両方含まなければ登録できない" do
        @user.password = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めての入力が必要です")
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "abc124"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "emailに@が含まれないと登録できない" do
        @user.email = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "first_nameが全角漢字、ひらがな、カタカナでないと登録できない" do
        @user.first_name = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角（漢字、ひらがな、カタカナ）での入力が必要です")
      end
      it "last_nameが全角漢字、ひらがな、カタカナでないと登録できない" do
        @user.last_name = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角（漢字、ひらがな、カタカナ）での入力が必要です")
      end
      it "first_furiganaが全角カタカナでないと登録できない" do
        @user.first_furigana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana は全角カタカナでの入力が必要です")
      end
      it "last_furiganaが全角カタカナでないと登録できない" do
        @user.last_furigana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana は全角カタカナでの入力が必要です")
      end
    end
  end
      
end