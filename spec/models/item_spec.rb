require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '9項目全て正しく記述があれば出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できないとき' do
      it '商品画像入力がない' do
      end
      it '商品名入力がない' do
      end
      it '商品名が40文字以上' do
      end
      it '商品説明入力がない' do
      end
      it '商品説明が1000文字以上' do
      end
      it 'カテゴリー入力がない' do
      end
      it 'カテゴリー選択が --- ' do
      end
      it '商品状態入力がない' do
      end
      it '商品状態選択が --- ' do
      end
      it '配送料入力がない' do
      end
      it '配送料選択が --- ' do
      end
      it '発送元入力がない' do
      end
      it '発送元選択が --- ' do
      end
      it '発送日数入力がない' do
      end
      it '発送日数選択が --- ' do
      end
      it '価格入力がない' do
      end
      it '価格が300未満' do
      end
      it '価格が9999999超過' do
      end
      it '価格が全角数字入力' do
      end
      it '価格が半角数字+全角数字入力' do
      end
    end
  end
end
