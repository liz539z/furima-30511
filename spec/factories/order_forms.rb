FactoryBot.define do
  factory :order_form do
    token { 'tok_abcdefghijk00000000000000000' }
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-2' }
    building { '101' }
    phone_num { '09012345678' }
  end
end
