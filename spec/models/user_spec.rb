require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "email一意性であること" do
      @user = FactoryBot.create(:user, email:'test@test')
      another_user = FactoryBot.build(:user, email: 'test@test')
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailには@を含む" do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "passwordが6文字以上でないと登録できない" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "passwordが半角英語のみでは登録できない" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "passwordが半角数字のみでは登録できない" do
      @user.password = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "passwordが全角では登録できない" do
      @user.password = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "passwordとpassword_confirmationは値が同じでないと登録できない" do
      @user.password_confirmation = "aaa123"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "family_nameが空では登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank", "Family name 全角(ひらがな カタカナ 漢字)が使えます"
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name 全角(ひらがな カタカナ 漢字)が使えます"
    end
    it "family_nameとlast_nameは漢字、平仮名、カタカナ以外では登録できない" do
      @user.family_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name 全角(ひらがな カタカナ 漢字)が使えます"
    end
    it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank", "Family name kana 全角カタカナのみが使えます"
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank", "Last name kana 全角カタカナのみが使えます"
    end
    it "family_name_kanaとlast_name_kanaは全角カタカナ以外では登録できない" do
      @user.family_name_kana = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana 全角カタカナのみが使えます"
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end

