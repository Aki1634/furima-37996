FactoryBot.define do
  factory :product do

    title {Faker::Lorem.sentence}
    association :user

    explanation {"あ"}
    price{"500"}
    category_id{"2"}
    situation_id{"2"}
    charge_id{"2"}
    prefectures_id{"2"}
    ship_day_id{"2"}

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
