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
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailがDBに存在している' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@が含まれていない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが半角英数字混合ではない(数字のみ)' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角英数字混合ではない(アルファベットのみ)' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordと確認passwordが一致しない' do
        @user.password = 'aaaaa0'
        @user.password_confirmation = 'aaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが全角漢字・ひらがな・カタカナ以外' do
        @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが全角漢字・ひらがな・カタカナ以外' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'name_seiが空' do
        @user.name_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei can't be blank")
      end

      it 'name_meiが空' do
        @user.name_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei can't be blank")
      end

      it 'name_seiがカタカナ以外' do
        @user.name_sei = 'あいう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei is invalid")
      end

      it 'name_meiがカタカナ以外' do
        @user.name_mei = 'あいう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei is invalid")
      end
      it 'birth_dateが空' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end

