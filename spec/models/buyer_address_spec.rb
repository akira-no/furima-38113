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
      it '建物名は空白可' do
      end
    end

    context '商品購入できないとき' do
      it 'tokenがない' do
      end
      it '郵便番号がない' do
      end
      it '郵便番号に - がない' do
      end
      it '郵便番号の - が3桁 - 4桁以外に使用' do
      end
      it '郵便番号が全角数字入力' do
      end
      it '郵便番号の前半が3桁以外' do
      end
      it '郵便番号の後半が4桁以外' do
      end
      it '発送元入力がない' do
      end
      it '発送元選択が --- ' do
      end
      it '市区町村がない' do
      end
      it '番地がない' do
      end
      it '電話番号がない' do
      end
      it '電話番号が全角数字入力' do
      end
      it '電話番号に - を入力' do
      end
      it '電話番号に () を入力' do
      end
      it '電話番号が10桁未満' do
      end
      it '電話番号が11桁超過' do
      end
      it 'userが紐付いていない' do
      end
      it 'itemが紐づいていない' do
      end
    end
  end
end

