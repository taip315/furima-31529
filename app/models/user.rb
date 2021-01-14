class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items


  with_options presence: true do 
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
    validates :first_furigana,format: {with: /\A[ァ-ヶ]+\z/, message: "は全角カタカナでの入力が必要です" }
    validates :last_furigana,format: {with: /\A[ァ-ヶ]+\z/, message: "は全角カタカナでの入力が必要です" }
    validates :birthday
  end
    validates :password,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は英字と数字の両方を含めての入力が必要です"}
end
