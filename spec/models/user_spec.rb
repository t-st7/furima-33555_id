require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録' do
    context 'ユーザー情報登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '同じemailは、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは、＠を含む事' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end

      it 'パスワードは、6文字以上出ないと登録できない' do
        @user.password = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英数字混合でないと登録できない(数字のみ)' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードは、半角英数字混合でないと登録できない(英字のみ)' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードは、全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '同じパスワードを、2回入力しなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '本人情報登録できない時' do
      it 'ユーザー本名は、苗字が入力されていなければ登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'ユーザー本名は、名前が入力されていなければ登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名(苗字)は、全角(漢字、ひらがな、カタカナ)での入力以外登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'ユーザー本名(名前)は、全角(漢字、ひらがな、カタカナ)での入力以外登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'ユーザー本名フリガナ(苗字)を、入力しないと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end

      it 'ユーザー本名フリガナ(名前)を、入力しないと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end

      it 'ユーザー本名フリガナ(苗字)は、全角（カタカナ）での入力でないと登録できない' do
        @user.kana_last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end

      it 'ユーザー本名フリガナ(名前)は、全角（カタカナ）での入力でないと登録できない' do
        @user.kana_first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end

      it '生年月日が入力されていなければ登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    context 'ユーザー情報登録できる時' do
      it '全て条件通りに入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
end
