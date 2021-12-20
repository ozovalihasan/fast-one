class ProductsController < ApplicationController
  before_action :set_cart, only: [:index, :show]
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :check_authorization, only: %i[ new create edit update destroy ]

  def index
    @page = params[:page] || 1
    @search_term = params[:search_term]
    @category = Category.find params[:category] if params[:category]&.present?
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
    if current_seller
      products = products.where("seller_id = ?", current_seller.id)
      @product = Product.new
      @product = @categories.first.products.new
    end
    if admin_signed_in? || seller_signed_in?
      @product = Product.new
      @product = @categories.first.products.new
    end
    @pagy, @products = pagy(products, page: @page)

  end

  def show
    unless admin_signed_in? || seller_signed_in?
      @order_item = @cart.order_items.find_by product_id: @product.id
      if @order_item.nil?
        @order_item = @cart.order_items.new product_id: @product.id
      end
    end
  end

  
  def new
    category = find_category_from_referrer || Category.first 
    @product = category.products.new
    if admin_signed_in?
      @sellers = Seller.all
      @product.seller = Seller.first
    end
  end

  def edit
    if admin_signed_in?
      @sellers = Seller.all
    end
  end
  
  def create
    @product = Product.new(product_params)
    if current_seller
      @product.seller = current_seller
    end
    respond_to do |format|
      if @product.save
        flash.now[ :notice ] = "#{@product.name} was successfully created."
        format.turbo_stream 
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        flash.now[ :notice ] = "#{@product.name} was successfully updated."
        format.turbo_stream 
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      flash.now[ :notice ] = "#{@product.name} is removed."
      format.turbo_stream 
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:quantity, :name, :price, :description, :category_id, :seller_id)
  end

  def check_authorization
    return true if admin_signed_in?    
    return false unless seller_signed_in?
    return false if @product && @product.seller != current_seller
  end

  def find_category_from_referrer
    category = nil

    if URI(request.referrer).query
      query_params = URI::decode_www_form( URI(request.referrer).query ).to_h
      if query_params["category"]
        category = Category.find_by id: query_params["category"]
      end
    end
    
    category
  end
  
end
