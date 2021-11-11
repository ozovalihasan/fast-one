class ProductsController < ApplicationController
  before_action :set_cart, only: [:index, :show]
  
  def index
    @products = Product.includes(:reviews)
  end

  def show
    @product = Product.includes(:shipping_locations).find(params[:id])
    @order_item = @cart.order_items.find_by product_id: @product.id
    if @order_item.nil?
      @order_item = @cart.order_items.new product_id: @product.id
    end
  end

  def search
    @products = Product.where("name ILIKE ?", "%#{params[:search_term]}%")
    respond_to do |format|
      format.turbo_stream 
    end
  end

end
