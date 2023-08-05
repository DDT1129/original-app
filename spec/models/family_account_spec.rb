require 'rails_helper'

RSpec.describe FamilyAccount, type: :model do
  before do
    @family_account = FactoryBot.build(:family_account)
  end
  
  describe '家族コードを登録する' do

    context 'できる' do
      it '[family_code]を入力する' do
        expect(@family_account).to be_valid
      end   
    end

    context 'できない' do
      
      it '[family_code]が空' do
        @family_account.family_code = nil
        @family_account.valid?
        expect(@family_account.errors.full_messages).to include("Family code is too short (minimum is 6 characters)", "Family code is invalid")
      end
      it '[family_code]が6桁数字のみのでないとき' do
        @family_account.family_code = "12345a"
        @family_account.valid?
        expect(@family_account.errors.full_messages).to include("Family code is invalid")
      end
    end
  
  end
end
