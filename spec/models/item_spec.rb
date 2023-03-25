require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end

  describe '出品の保存' do
    context '出品できる場合' do
      it '必要な項目を入力し出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'contentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'category_idが初期状態では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが初期状態では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'charge_idが初期状態では出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end

      it 'Prefecture_idが初期状態では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end


      it 'term_idが初期状態では出品できない' do
        @item.term_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Term must be other than 1")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300より少ない場合出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ('Price must be greater than or equal to 300')
      end
      it 'priceが¥9,999,999より大きい場合出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ('Price must be less than or equal to 9999999')
      end

      it 'priceが全角の場合出品できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end