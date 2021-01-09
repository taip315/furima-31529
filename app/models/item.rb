class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :delivery_fee
    belongs_to :prefecture
    belongs_to :day

    with_options numericality: {other_than: 1} do 
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :day_id
    end
  
end
