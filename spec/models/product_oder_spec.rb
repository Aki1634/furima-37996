require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @product_order = FactoryBot.build(:product_order, user_id: user.id, product_id: product.id)
      sleep 0.1
    end
    describe '購入者情報の保存' do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@product_order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @product_order.building_name = ""
        expect(@product_order).to be_valid
      end
    end
    context '商品を購入できない場合' do
      it '郵便番号が空だと購入ができない' do
        @product_order.postal_code = ""
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @product_order.postal_code = "12345678"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefectures_idが---だと購入できない' do
        @product_order.prefectures_id = "1"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Prefectures must be other than 1")
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
        expect(@product_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @product_order.phone_number = "080123456"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上では購入できない' do
        @product_order.phone_number = "0801234567890"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @product_order.phone_number = "080123456aa"
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空だと保存できないこと' do
        @product_order.token = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @product_order.user_id = ""
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end
      it 'product_idが紐付いていなければ購入できない' do
        @product_order.product_id = ""
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end
  end
end

