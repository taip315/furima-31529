class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postal_number, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :municipality
    validates :address 
    validates :phone_number, format:{with: /\A^0\d{9,10}$\z/, message: "Input only number"}
  end
  

  def save(user_id, item_id)
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddess.create(postal_number: postal_number, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end