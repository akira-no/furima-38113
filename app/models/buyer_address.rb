class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :city, :house_number, :prefecture_id, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,      format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :house_number
    validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number,   format: { with: /\A\d{10,11}\z+/ }
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, city: city, house_number: house_number, prefecture_id: prefecture_id, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end