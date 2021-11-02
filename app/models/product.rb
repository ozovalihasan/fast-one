class Product < ApplicationRecord
  belongs_to :seller , class_name: "User"
  has_many :order_items
  has_many :reviews
  has_many :shipping_locations
  has_many :questions
end
