class Order < ApplicationRecord
  belongs_to :consumer , class_name: "User"
  has_many :order_items
end
