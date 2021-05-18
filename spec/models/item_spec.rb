require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '正常系' do
      it '全てあれば登録できること' do
        expect(@item).to be_valid
      end

      it '半角数字でなければ登録できること' do
        @item.price = 300
        @item.valid?
        expect(@item).to be_valid
      end

      it 'priceが300 〜 9,999,999の間だと登録できる' do
        @item.price = 100
        @item.price = 1000000
        @item.valid?
        expect(@item).to be_valid
      end

    end

    context '異常系' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'categoryが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end

      it 'category_idが１(--)だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it 'stateが空だと登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State is not a number"
      end

      it 'state_idが１(--)だと登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end

      it 'postageが空だと登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage is not a number"
      end

      it 'postage_idが１(--)だと登録できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage must be other than 1"
      end

      it 'regionalが空だと登録できない' do
        @item.regional_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Regional is not a number"
      end

      it 'regional_idが１(--)だと登録できない' do
        @item.regional_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Regional must be other than 1"
      end

      it 'shipping_dataが空だと登録できない' do
        @item.shipping_data_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping data is not a number"
      end

      it 'shipping_data_idが１(--)だと登録できない' do
        @item.shipping_data_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping data must be other than 1"
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが全角数字だと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it 'priceが半角英数混合では登録できないこと' do
        @item.price = 'a10'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it 'priceが299円以下では登録できないこと' do
        @item.price = 290
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it '10,000,000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end

      it 'userが紐付いていないと登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end