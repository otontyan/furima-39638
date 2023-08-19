class SendBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :city
    validates :street_address
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(item_id:, user_id:)
    Address.create(postal_code:, shipping_origin_id:, city:, street_address:,
                   building_name:, phone_number:, buy_id: buy.id)
  end
end
