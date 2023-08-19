require 'rails_helper'

RSpec.describe Address, type: :model do

    before do
       @user = FactoryBot.create(:user)
       @item = FactoryBot.create(:item)
       @address = FactoryBot.build(:,user_id: @user.id, item_id: @item.id)
    end

    describe '商品購入記録の保存' do

    context '内容に問題ない場合' do

      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@address).to be_valid
      end

      it '建物名が空でも購入できること' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end
  end
end