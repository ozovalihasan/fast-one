class CategoriesController < ApplicationController
  before_action :set_cart
  before_action :set_category, only: %i[edit update destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    if admin_signed_in?
      @category = Category.new
    end
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        flash.now[ :notice ] = "#{@category.name} is created."
        format.turbo_stream 
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        flash.now[ :notice ] = "#{@category.name} is updated."
        format.turbo_stream 
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      flash.now[ :notice ] = "#{@category.name} is removed."
      format.turbo_stream 
    end
  end

  private

  def category_params
    params.require(:category).permit( :name )
  end

  def set_category
    @category = Category.find(params[:id])
  end

  
end
