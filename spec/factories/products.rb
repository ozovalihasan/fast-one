FactoryBot.define do
  factory :product do
    quantity { Faker::Number.number(digits: 2) }
    name { Faker::Device.model_name }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    description { Faker::Lorem.paragraph }
    seller_id { User.ids.sample }
  end
end
