class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :street_name, :house_number, :prefecture_id, :building_name, :phone_number, :buyer_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,　　　　　　3桁ハイフン4桁の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
    validates :street_name
    validates :house_number
    validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number,　　　　10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678
    validates :buyer_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, street_name: street_name, house_number: house_number, prefecture_id: prefecture_id, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end