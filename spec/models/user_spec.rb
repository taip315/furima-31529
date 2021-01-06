require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
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
    it "nickname,email,password,password_confirmation,first_name,last_name,first_furigana,last_furigana,birthdayがあれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      expect(@user).to be_valid
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
  end
  
  describe "ユーザーログイン" do
  end
end