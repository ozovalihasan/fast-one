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
        format.turbo_stream 
        # format.html { redirect_to root_path, notice: "Category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
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
