class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image,                  presence: true
  validates :product,                presence: true, length: { maximum: 40 }
  validates :explanation,            presence: true, length: { maximum: 1000 }
  validates :condition_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id,            presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                  presence: true,
                                     numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
