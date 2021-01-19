require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できない時' do
      it '商品画像を一枚付けていないと出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が,空だと出品出来ない。' do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end

      it '商品の説明が、空だと出品出来ない。' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が、選択されていないと出品出来ない。' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it '商品の状態についての、情報が選択されていないと出品出来ない。' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end

      it '配送料の負担についての、情報が選択されていないと出品出来ない。' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge is not a number')
      end

      it '発送元の地域についての、情報が選択されていないと出品出来ない。' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end

      it '発送までの日数についての、情報が選択されていないと出品出来ない。' do
        @item.day_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to ship is not a number')
      end

      it '各ActiveHashのidが1の時保存できないこと(カテゴリー)' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '各ActiveHashのidが1の時保存できないこと(商品の状態)' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it '各ActiveHashのidが1の時保存できないこと(配送料の負担)' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
      end

      it '各ActiveHashのidが1の時保存できないこと(発送までの日数)' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to ship must be other than 1')
      end

      it '各ActiveHashのidが0の時保存できないこと(stateの時)' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 0')
      end

      it '価格についての、情報が選択されていないと出品出来ない。' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it '価格の範囲が、¥300~¥9,999,999の間で無ければ出品出来ない。(¥299以下)' do
        @item.price = '99'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格の範囲が、¥300~¥9,999,999の間で無ければ出品出来ない。(¥10,000,000以上)' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '販売価格は半角数字のみ保存可能であること(英字)' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格は半角数字のみ保存可能であること(全角)' do
        @item.price = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格は半角数字のみ保存可能であること(半角英数混合)' do
        @item.price = '111aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
    context '商品出品出来る時' do
      it '全ての情報が入力、選択されていたら出品できる。' do
        expect(@item).to be_valid
      end
    end
  end
end
