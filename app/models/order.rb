class Order < ApplicationRecord
  belongs_to :consumer , class_name: "User"
  has_many :order_items, dependent: :destroy

  def total_item
    order_items.pluck(:quantity).sum
  end

  def total_price
    items = order_items.includes :product

    quantities = items.pluck(:quantity)
    prices = items.pluck(:price)
    quantities.zip(prices).inject(0) {|sum, item| sum + (item.first * item.last)}

  end
end
