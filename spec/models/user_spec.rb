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
  end
end
