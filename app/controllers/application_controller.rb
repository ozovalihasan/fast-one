class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit
  include Pagy::Backend

  before_action :set_categories

  private

  def set_categories
    @categories = Category.all
  end
    
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
