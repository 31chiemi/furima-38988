require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shipment = FactoryBot.build(:order_shipment, user_id: @user.id, item_id: @item.id,)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipment).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipment.building = ''
        expect(@order_shipment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @order_shipment.postcode = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipment.postcode = '1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'postcodeが全角だと保存できないこと' do
        @order_shipment.postcode = '９９９－９９９９'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが初期状態では保存できないこと' do
        @order_shipment.prefecture_id = '1'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @order_shipment.block = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Block can't be blank")
      end
      it 'phonenumberが空だと保存できないこと' do
        @order_shipment.phonenumber = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_shipment.token = nil
        @order_shipment.valid?
        expect( @order_shipment.errors.full_messages).to include("Token can't be blank")
      end

      it 'phonenumberが全角だと保存できないこと' do
        @order_shipment.phonenumber = '９９９９９９９９９９'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberがハイフンを含んでいると保存できないこと' do
        @order_shipment.phonenumber = '999-999-9999'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが10桁以下の場合保存できないこと' do
        @order_shipment.phonenumber = '999999999'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが12桁以上の場合保存できないこと' do
        @order_shipment.phonenumber = '999999999999'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipment.user_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipment.item_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
