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

  with_options presence: true do
    validates :image               
    validates :product,             length: { maximum: 40 }
    validates :explanation,         length: { maximum: 1000 }
    validates :condition_id,        numericality: { other_than: 1, message: "can't be blank" }
    validates :category_id,         numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_charge_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id,       numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_day_id,     numericality: { other_than: 1, message: "can't be blank" }
    validates :price,               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
