class CheckoutsController < ApplicationController
  def create
    product = Product.first
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [
        {
          name: product.name,
          amount: 300,
          currency: "usd",
          quantity: 1
        }
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