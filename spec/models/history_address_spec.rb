require 'rails_helper'

RSpec.describe HistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.1
    @history_address = FactoryBot.build(:history_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '正常系' do
      it '全てあれば登録できること' do
        expect(@history_address).to be_valid
      end

      it 'building_nameがなくても登録できること' do
        @history_address.building_name = ''
        @history_address.valid?
        expect(@history_address).to be_valid
      end

      it 'postal_codeが半角数字であれば登録できること' do
        @history_address.postal_code = '111-1111'
        @history_address.valid?
        expect(@history_address).to be_valid
      end

      it 'phone_numberが11文字であれば登録できること' do
        @history_address.phone_number = '12345678901'
        @history_address.valid?
        expect(@history_address).to be_valid
      end

      it 'phone_numberが10文字であれば登録できること' do
        @history_address.phone_number = '1234567890'
        @history_address.valid?
        expect(@history_address).to be_valid
      end

      it "tokenがあれば保存ができること" do
        expect(@history_address).to be_valid
      end
    end


    context '異常系' do
      it 'postal_codeが空だと登録できない' do
        @history_address.postal_code = ""
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Postal code can't be blank", "Postal code is invalid"
        
      end

      it 'postal_codeにーがないと登録できない' do
        @history_address.postal_code = "1111111"
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Postal code is invalid"
      end

      it 'postal_codeが８文字以下では登録できないこと' do
        @history_address.postal_code = "111-111"
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Postal code is invalid"
      end

      it 'regional_idが１(--)だと登録できない' do
        @history_address.regional_id = 1
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Regional must be other than 1"
      end

      it 'municipalityが空だと登録できない' do
        @history_address.municipality = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'addressが空だと登録できない' do
        @history_address.address = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberが空だと登録できない' do
        @history_address.phone_number = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid"
      end

      it 'phone_numberが全角数字だと登録できない' do
        @history_address.phone_number = '１１１１１１１１１１１'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'phone_number半角英数混合では登録できないこと' do
        @history_address.phone_number = 'a1234567890'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'phone_number半角英語では登録できないこと' do
        @history_address.phone_number = 'aaaaaaaaaaa'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'phone_numberが9文字以下では登録できないこと' do
        @history_address.phone_number = '123456789'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Phone number is invalid"
      end


      it 'phone_numberが12文字以上では登録できないこと' do
        @history_address.phone_number = '123456789012'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Phone number is invalid"
      end

      it "user_idが空では登録できないこと" do
        @history_address.user_id = nil
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "User can't be blank"
      end

      it "item_idが空では登録できないこと" do
        @history_address.item_id = nil
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
