FactoryBot.define do
  factory :shipping_location do
    name { Faker::Address.country }
    product_id { Product.ids.sample }
  end
end
