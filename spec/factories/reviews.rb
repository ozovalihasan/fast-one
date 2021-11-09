FactoryBot.define do
  factory :review do
    body { Faker::Lorem.paragraph }
    star { Faker::Number.between(from: 1, to: 5)  }
    product_id { Product.ids.sample }
  end
end
