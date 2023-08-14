class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :shipping_origin
  belongs_to :days_to_ship

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_origin_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true #条件を定義（数字のみ=、価格の範囲）
  validates :image, presence: true

  has_one_attached :image

  belongs_to :user
  #has_one    :buy

end