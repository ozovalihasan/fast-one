# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create(:user)

5.times do
  FactoryBot.create(:category)
end

15.times do
  FactoryBot.create(:product)
end


30.times do
  FactoryBot.create(:review)
end

50.times do
  FactoryBot.create(:shipping_location)
end

50.times do
  FactoryBot.create(:question)
end

50.times do
  FactoryBot.create(:answer)
end



