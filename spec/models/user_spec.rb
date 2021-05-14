require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
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
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user).to be_valid
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
    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
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
