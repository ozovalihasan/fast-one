FactoryBot.define do
  factory :question do
    body { Faker::Lorem.paragraph }
    product_id { Product.ids.sample }
    consumer_id { User.ids.sample }
  end
end
