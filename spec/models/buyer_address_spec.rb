require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buyeraddress = FactoryBot.build(:buyer_address, item_id: item.id, user_id: user.id)
  end



  describe '商品購入' do
    context '商品購入できるとき' do
      it 'building_nameを除く項目全て正しく記述があれば購入できる' do
        expect(@buyer_address).to be_valid
      end
    end
  end
end

#     context '商品出品できないとき' do
#       it '商品画像入力がない' do
#         @item.image = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Image can't be blank")
#       end
#       it '商品名入力がない' do
#         @item.product = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Product can't be blank")
#       end
#       it '商品名が40文字以上' do
#         @item.product = Faker::Internet.password(min_length: 41)
#         @item.valid?
# end
