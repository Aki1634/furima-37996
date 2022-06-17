require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品出品' do
    context '商品を出品できる場合' do

      it "入力フォームの条件を全て満たしていれば登録できる" do
        expect(@product).to be_valid
      end

end
context '商品を出品できない場合' do

  it "商品名が空では登録できない"do
  @product.title = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Title can't be blank")
end

  it "商品の説明が空では登録できない"do
  @product.explanation = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Explanation can't be blank")
end

it "カテゴリーが---では登録できない"do
@product.category_id = '1'
  @product.valid?
  expect(@product.errors.full_messages).to include("Category can't be blank")
end

it "商品の状態が---では登録できない"do
@product.situation_id = '1'
  @product.valid?
  expect(@product.errors.full_messages).to include("Situation can't be blank")
end

it "配送料の負担が---では登録できない"do
@product.charge_id = '1'
  @product.valid?
  expect(@product.errors.full_messages).to include("Charge can't be blank")
end

it "発送元の地域が---では登録できない"do
@product.prefectures_id = '1'
  @product.valid?
  expect(@product.errors.full_messages).to include("Prefectures can't be blank")
end

it "発送までの日数が---では登録できない"do
@product.ship_day_id = '1'
@product.valid?
expect(@product.errors.full_messages).to include("Ship day can't be blank")
end

it "価格が空では登録できない"do
@product.price = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Price can't be blank")
end

it "価格が300未満では登録できない"do
@product.price = '299'
  @product.valid?
  expect(@product.errors.full_messages).to include("Price 価格 は300以上9999999以下の数字で入力してください")
end

it "価格が9,999,999より大きい場合では登録できない"do
@product.price = '10,000,000'
  @product.valid?
  expect(@product.errors.full_messages).to include("Price 価格 は300以上9999999以下の数字で入力してください")
end

it "価格が半角数値ではない場合登録できない"do
@product.price = '２０００'
  @product.valid?
  expect(@product.errors.full_messages).to include("Price 価格 は300以上9999999以下の数字で入力してください")
end

it"画像がない場合保存できない"do
@product.image = nil
@product.valid?
expect(@product.errors.full_messages).to include()
end



end
end
end