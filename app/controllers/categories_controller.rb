class CategoriesController < ApplicationController
  before_action :set_cart

  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @products = @category.products.includes :reviews
  end
end
