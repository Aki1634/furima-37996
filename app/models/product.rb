class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :charge
  belongs_to_active_hash :ship_day

  validates :title,       presence: true
  validates :explanation, presence: true
  validates :price,       presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 300,
                                          less_than_or_equal_to: 9_999_999,
                                          message: '価格 は300以上9999999以下の数字で入力してください' }

  validates :category_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :image,          presence: true 
end
