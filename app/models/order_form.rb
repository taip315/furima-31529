class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :municipality, :address, :building, :phone_number

  # with_options presence: true do
  #   validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  #   validates :municipality,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
  #   validates :address , format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
  #   validates :phone_number, format:{with: /\A^0\d{9,10}$\z/, messages: "Don't include hyphen(-)"}
  # end
  # validates :building, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "Input full-width characters." }

  def save(user_id, item_id)
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddess.create(postal_number: postal_number, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end