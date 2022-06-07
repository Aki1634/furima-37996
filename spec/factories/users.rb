FactoryBot.define do
  factory :user do
    nickname {"a"}
    
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    first_name {"あ"}
    last_name {"あ"}
    first_furigana {"ア"}
    last_furigana {"ア"}
    birth_day{"2020-10-01"}
  end
end