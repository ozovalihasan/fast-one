class CategoriesController < ApplicationController
  before_action :set_cart

  def index
    @categories = Category.all
  end
  
end
