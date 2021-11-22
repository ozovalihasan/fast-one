class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit
  include Pagy::Backend

  before_action :set_categories

  private

  def set_categories
    @categories = Category.all
  end
    
end
