class ProductOrder 
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :city_name, :block_name, :building_name, :phone_number, :product_id, :user_id

  with_options presence: true do
    validates :token, :city_name, :block_name
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postal_code, length: { is: 8 } 
    end
  end

    def save
      Address.create(postal_code: postal_code, prefectures_id: prefecture_id, city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number)
      Order.create(user_id: user_id, product_id: product_id)
    end
end