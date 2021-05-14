require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "正常系" do
      it '全ての値が正常であれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user).to be_valid
      end

      it "first_name_kが「カナ」のみ登録できること" do
        @user.first_name_k = 'カナ'
        @user.valid?
        expect(@user).to be_valid
      end

      it "last_name_kが「カナ」のみ登録できること" do
        @user.last_name_k = 'カナ'
        @user.valid?
        expect(@user).to be_valid
      end

      it "passwordが数字のみでは登録できない" do
        @user.password = '000000'
        @user.valid?
        expect(@user).to be_valid
      end

      it "passwordが英字のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user).to be_valid
      end

      it "passwordが全角では登録できない" do
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context "異常系" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it "emailに＠がなければ登録できない" do
        @user.email = "samplegmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが５文字以下では登録できない" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "first_nameが漢字・平仮名・カタカナ以外では登録できない" do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "last_nameが漢字・平仮名・カタカナ以外では登録できない" do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it "first_name_kが空では登録できない" do
        @user.first_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name k can't be blank"
      end

      it "last_name_kが空では登録できない" do
        @user.last_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name k can't be blank"
      end

      it "birthday_yearが空では登録できない" do
        @user.birthday_year = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday year can't be blank"
      end
    end
  end
end
