FactoryBot.define do
  factory :item do
    item_name          { '商品名' }
    item_description   { '商品説明' }
    category_id        { '2' }
    item_condition_id  { '2' }
    shipping_cost_id   { '2' }
    shipping_origin_id { '2' }
    days_to_ship_id    { '2' }
    price              { '500' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end

    association :user
  end
end
