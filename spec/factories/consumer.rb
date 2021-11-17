FactoryBot.define do
  factory :consumer do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end
