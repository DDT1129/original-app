require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end
  
  describe 'メモの作成' do
    context 'できる' do
      it '[text]を入力する' do
        expect(@memo).to be_valid
      end
      it '[text]は255文字以内にする' do
        @memo.text = Faker::Lorem.characters(number: 255)
        expect(@memo).to be_valid
      end
    end
    
    context 'できない' do
      it '[text]が空のとき' do
        @memo.text = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Text can't be blank")
      end
      it '[text]は255文字を超えるとき' do
        @memo.text = Faker::Lorem.characters(number: 256)
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Text is too long (maximum is 255 characters)")
      end
      it 'userが紐付いていなとき' do
        @memo.user = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include("User must exist")
      end
    end
  end
end
