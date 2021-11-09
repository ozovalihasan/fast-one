class ProductsController < ApplicationController
  before_action :set_cart
  
  def index
    @products = Product.includes(:reviews)
  end

  def show
    @cart = current_order
    @product = Product.includes(:shipping_locations).find(params[:id])
    @order_item = @cart.order_items.find_by product_id: @product.id
    if @order_item.nil?
      @order_item = @cart.order_items.new product_id: @product.id
    end
    
  end

  private

  def set_cart
    @cart = current_order
  end
  
end
