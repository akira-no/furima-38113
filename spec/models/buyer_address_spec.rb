require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buyer_address = FactoryBot.build(:buyer_address, item_id: item.id, user_id: user.id)
  end



  describe '商品購入' do
    context '商品購入できるとき' do
      it '全項目正しく記述があれば購入できる' do
        expect(@buyer_address).to be_valid
      end
    end
  end
end

