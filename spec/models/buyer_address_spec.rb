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
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenがない' do
        @buyer_address.token = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がない' do
       @buyer_address.post_code = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号に - がない' do
        @buyer_address.post_code = "1234567"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号の - が3桁 - 4桁以外に使用' do
        @buyer_address.post_code = "1-3-5-7"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号が全角数字入力' do
        @buyer_address.post_code = "２２２-２２２２"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号が3桁 - 4桁以外' do
        @buyer_address.post_code = "1234-567"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid")
      end
      it '発送元入力がない' do
        @buyer_address.prefecture_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元選択が --- ' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がない' do
        @buyer_address.city = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地がない' do
        @buyer_address.house_number = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号がない' do
        @buyer_address.phone_number = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が全角数字入力' do
        @buyer_address.phone_number = "１２３４５６７８９０１２"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号に - を入力' do
        @buyer_address.phone_number = "010-1234-5678"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号に () を入力' do
        @buyer_address.phone_number = "010(1234)5678"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が10桁未満' do
        @buyer_address.phone_number = "123456789"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11桁超過' do
        @buyer_address.phone_number = "123456789012"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

