FactoryBot.define do
  factory :item do
    name { '参考書' }
    describe { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { 2000 }

    association :user

    after(:build) do |pic|
      pic.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
