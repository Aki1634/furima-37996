require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
    before do
      @product_order = FactoryBot.build(:product_order)
    end
    describe '購入者情報の保存' do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@product_order).to be_valid
      end
    end
    context '商品を購入できない場合' do
      it '郵便番号が空だと購入ができない' do
        @product_order.postal_code = ""
        @product_order.valid?
        expect(@product_order.errors.messages).to include({:postal_code => ["can't be blank", "is invalid", "is the wrong length (should be 8 characters)"]})
      end
      it '郵便番号にハイフンがないと登録できない' do
        @product_order.postal_code = "12345678"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が8桁でないと購入できない' do
        @product_order.postal_code = "123-458"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Postal code is invalid", "Postal code is the wrong length (should be 8 characters)")
      end
      it 'prefectures_idが空だと購入できない' do
        @product_order.prefectures_id = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'city_nameが空だと購入できない' do
        @product_order.city_name = ""
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("City name can't be blank")
      end
      it 'block_nameが空だと購入できない' do
        @product_order.block_name = ""
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Block name can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @product_order.phone_number = ""
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが11桁でなければ購入できない' do
        @product_order.phone_number = "080123456789"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number is invalid")
      end
  end
end

