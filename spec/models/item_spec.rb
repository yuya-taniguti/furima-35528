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
        @item.price = '300'
        @item.valid?
        expect(@item).to be_valid
      end

      it 'priceが300 〜 9,999,999の間だと登録できる' do
        @item.price = '100'
        @item.price = '1000000'
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

      it 'stateが空だと登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State is not a number"
      end

      it 'postageが空だと登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage is not a number"
      end

      it 'regionalが空だと登録できない' do
        @item.regional_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Regional is not a number"
      end

      it 'shipping_dataが空だと登録できない' do
        @item.shipping_data_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping data is not a number"
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが全角数字だと登録できない' do
        @item.price = '３００'
        @item.valid?
        
      end

    end
  end
end