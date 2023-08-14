require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    # 正規表現
    context '商品が出品できるとき' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '商品名が空では出品できない' do
        @item.item_name = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.item_description = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では出品できない' do
        @item.item_condition_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '配送料の負担が空では出品できない' do
        @item.shipping_cost_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域が空では出品できない' do
        @item.shipping_origin_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it '発送までの日数が空では出品できない' do
        @item.days_to_ship_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '価格は299円以下の場合は保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格は9,999,999円より大きい場合は保存できないこと' do
        @item.price = 10_000_000_000 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.price = 'あああ' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
