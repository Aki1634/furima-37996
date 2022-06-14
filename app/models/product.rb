class Product < ApplicationRecord
  belongs_to :user
 # has_one :log
 has_one_attached :image

 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :Situation
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :charge
  belongs_to_active_hash :ship_day

  validates :title,       presence: true
  validates :explanation, presence: true
  validates :price,       presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" } 
end
