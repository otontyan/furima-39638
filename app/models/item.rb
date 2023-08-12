class Item < ApplicationRecord

  has_one_attached :image
  
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category, presence: true
  validates :item_condition, presence: true
  validates :shipping_cost, presence: true
  validates :shipping_origin, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true
  validates :user, presence: true, foreign_key: true

  belongs_to :user
  #has_one    :buy

end