class QuestionsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @questions = @product.questions.includes(:answer)
  end
end
