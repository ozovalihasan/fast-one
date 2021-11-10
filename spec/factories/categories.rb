FactoryBot.define do
  factory :category do
    name { Faker::Lorem.words(number: 4).join(" ") }
  end
end
