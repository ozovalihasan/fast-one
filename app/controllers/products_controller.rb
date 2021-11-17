class ProductsController < ApplicationController
  before_action :authenticate_seller!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_cart, only: [:index, :show]
  before_action :set_product, only: %i[ show edit update destroy ]

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
    @origin = params[:origin]
    @categories = Category.all
    @pagy, @products = pagy(products, page: @page)
  end

  def show
    @order_item = @cart.order_items.find_by product_id: @product.id
    if @order_item.nil?
      @order_item = @cart.order_items.new product_id: @product.id
    end
  end
  
  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
  end
  
  def create
    @product = Product.new(product_params)
    @product.seller = current_seller
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:quantity, :name, :price, :description, :category_id)
  end

end
