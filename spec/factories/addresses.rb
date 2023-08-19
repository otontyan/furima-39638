FactoryBot.define do
  factory :address do
    postal_code { '123-1234' }
    shipping_origin_id { 2 }
    city { '横浜市緑区' }
    street_address { '3-4' }
    building_name { '青山ビル' }
    phone_number { '09012341234' }
  end
end
