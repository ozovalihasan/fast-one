class ProductsController < ApplicationController
  before_action :set_cart, only: [:index, :show]
  
  def index
    @page = params[:page] || 1
    @search_term = params[:search_term]
    @category = Category.find params[:category] if params[:category]
    products = if @search_term && !@search_term.empty?
      if @category
        @category.products.search(@search_term).includes(:reviews)
      else
        Product.search(@search_term).includes(:reviews)
      end
    else
      if @category 
        @category.products.includes(:reviews)
      else
        Product.includes(:reviews)
      end
    end
    @origin = params[:origin]
    
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
