FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.free_email }
    password { 'a12345' }
    password_confirmation { 'a12345' }
    first_name { '沼田' }
    last_name { '太郎' }
    first_name_kana { 'ヌマタ' }
    last_name_kana { 'タロウ' }
    birthday { '1930-01-01' }
  end
end
