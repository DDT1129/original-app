require 'rails_helper'

RSpec.describe Situation, type: :model do
  before do
    @situation = FactoryBot.build(:situation)
  end
  
  describe '外出・帰宅の別を投稿' do
    context 'できる' do
      it '[genre_id]を入力する' do
        expect(@situation).to be_valid
      end   
      it '[purpose]は空でもいい' do
        @situation.purpose = ''
        expect(@situation).to be_valid
      end
    end

    context 'できない' do
      it '[genre_id]が空' do
        @situation.genre_id = nil
        @situation.valid?
        expect(@situation.errors.full_messages).to include("Genre can't be blank")
      end
      it 'userが紐付いていない' do
        @situation.user = nil
        @situation.valid?
        expect(@situation.errors.full_messages).to include("User must exist")
      end
    end
  end
end
