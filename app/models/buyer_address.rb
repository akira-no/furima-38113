class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :street_name, :house_number, :prefecture_id, :building_name, :phone_number, :buyer_id

  validates :user_id,
  validates :item_id,
  validates :post_code,
  validates :street_name,
  validates :house_number,
  validates :prefecture_id,
  validates :phone_number,
  validates :buyer_id,
end