class ProductsController < ApplicationController
  before_action :set_cart, only: [:index, :show]
  
  def index
    @page = params[:page] || 1
    @search_term = params[:search_term]
    @origin = params[:origin]
    products = if @search_term && !@search_term.empty?
      Product.search(@search_term).includes(:reviews)
    else
      Product.includes(:reviews)
    end
    
    @pagy, @products = pagy(products, page: @page)
  end

  def show
    @product = Product.includes(:shipping_locations).find(params[:id])
    @order_item = @cart.order_items.find_by product_id: @product.id
    if @order_item.nil?
      @order_item = @cart.order_items.new product_id: @product.id
    end
  end

end
