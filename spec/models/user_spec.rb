require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '9項目全て正しく記述があれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      it 'nicknameが空' do
        
      end
      it 'emailが空' do
      end
      it 'emailがDBに存在している' do
      end
      it 'emailに@が含まれていない' do
      end
      it 'passwordが空' do
      end
      it 'passwordが6文字未満' do
      end
      it 'passwordが半角英数字混合ではない' do
      end
      it 'passwordと確認passwordが一致しない' do
      end
      it 'last_nameが空' do
      end
      it 'first_nameが空' do
      end
      it 'last_nameが全角漢字・ひらがな・カタカナ以外' do
      end
      it 'first_nameが全角漢字・ひらがな・カタカナ以外' do
      end
      it 'name_seiが空' do
      end
      it 'name_meiが空' do
      end
      it 'name_seiがカタカナ以外' do
      end
      it 'name_meiがカタカナ以外' do
      end
      it 'birth_dateが空' do
      end
    end
  end
end

