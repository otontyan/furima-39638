class SendBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code { with: ^\d{3}-\d{4}$ }
    validates :phone_number { with: \A0\d{10,11}\z }
    validates :city, :street_address, :item_id, :user_id
  end
  validates :shipping_origin_id, numericality: { other_than: 1 , message: "can't be blank"} 

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    
    Send.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end