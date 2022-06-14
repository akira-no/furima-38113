class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  validates :product,                presence: true, length: { maximum: 8 }
  validates :explanation,            presence: true, length: { maximum: 1000 }
  validates :condition_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id,            presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id,     presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,          presence: true, numericality: { other_than: 1 }
  validates :delivery_day_id,        presence: true, numericality: { other_than: 1 }
  validates :price,                  presence: true, length: { minimum: 300 , maximum: 9999999}