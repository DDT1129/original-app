require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it '[nickname][code][email][password][password_confirmation]の項目を全て正しく記入する' do
        expect(@user).to be_valid
      end
      it '[email][password_confirmation]が同一で、6文字以上のとき' do
        @user.password = "a12345"
        @user.password_confirmation = @user.password 
        expect(@user).to be_valid
      end   
    end

    context '新規登録できない' do
      it '[nickname]が空' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '[email]が空' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '[email]に@が含まれていない' do
        @user.email = '123.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '[email]が既に登録済みのものと重複するとき' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it '[password]が5文字以下のとき' do
        @user.password = '1234a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '[password]が129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it '[password]と[password_confirmation]が不一致' do
        @user.password = 'fp1234'
        @user.password_confirmation = '1234fp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '[password_confirmation]が空' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '[password]が空' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '[password]が英字のみ' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字の両方を含めて半角で入力してください")
      end
      it '[password]が数字のみ' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字の両方を含めて半角で入力してください")
      end
      it '[password]が全角文字を含む' do
        @user.password = 'TEST１２３'
        @user.password_confirmation = 'TEST１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字の両方を含めて半角で入力してください")
      end
    end

  end
end
