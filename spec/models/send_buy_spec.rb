require 'rails_helper'

RSpec.describe SendBuy, type: :model do
  describe '商品購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @sendbuy = FactoryBot.build(:send_buy, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@sendbuy).to be_valid
      end
      it '建物名が空でも購入できること' do
        @sendbuy.building_name = ''
        expect(@sendbuy).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @sendbuy.postal_code = ''
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @sendbuy.postal_code = '123-123４'
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @sendbuy.shipping_origin_id = '1'
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @sendbuy.city = ''
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @sendbuy.street_address = ''
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @sendbuy.phone_number = nil
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @sendbuy.phone_number = '090123456'
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと購入できない' do
        @sendbuy.phone_number = '090123456789'
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @sendbuy.phone_number = '０9012341234'
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @sendbuy.user_id = ''
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @sendbuy.item_id = ''
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できないこと' do
        @sendbuy.token = nil
        @sendbuy.valid?
        expect(@sendbuy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
