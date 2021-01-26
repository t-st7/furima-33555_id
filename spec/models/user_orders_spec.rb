require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入機能' do
    context '商品購入できない時' do
      it '郵便番号が空だと購入できない' do
        @user_order.zip = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Zip is invalid')
      end

      it '都道府県が空だと購入できない' do
        @user_order.state_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("State can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できない' do
        @user_order.address_line = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address line can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号にハイフンが無いと購入できない' do
        @user_order.zip = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Zip is invalid')
      end

      it '電話番号にハイフンがあると購入できない' do
        @user_order.phone_number = '090-1234-5678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が11桁じゃないと購入できない(12以上)' do
        @user_order.phone_number = '090123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が11桁じゃないと購入できない(10以下)' do
        @user_order.phone_number = '090123'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号に数字以外が混じっていると購入できない' do
        @user_order.phone_number = '090aiueoaiu'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end



    context '購入できる時' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@user_order).to be_valid
      end

      it '建物名がなくても、商品の購入ができること' do
        @user_order.address_line_second = nil
        expect(@user_order).to be_valid
      end


    end
  end
end
