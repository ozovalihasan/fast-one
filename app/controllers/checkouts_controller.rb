class CheckoutsController < ApplicationController
  def create
    set_cart
    order_items = @cart.order_items.includes :product
    order_items = order_items.map do |order_item|
      {
        name: order_item.product.name,
        amount: (order_item.product.price * 100).to_i,
        currency: "usd",
        quantity: order_item.quantity
      }
    end

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [
        order_items
      ],
      mode: 'payment',
      success_url: categories_url,
      cancel_url: categories_url,
    })

    respond_to do |format|
      format.js
      format.turbo_stream
    end
    
  end
  
end