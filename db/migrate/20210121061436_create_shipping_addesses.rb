class CreateShippingAddesses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addesses do |t|
      t.string :postal_number,           null: false
      t.integer :prefecture_id,          null: false
      t.string :municipality,            null: false
      t.string :address,                 null: false
      t.string :building
      t.string :phone_number,            null: false
      t.references :order,               null: false,  foreign_key: true
      t.timestamps
    end
  end
end
