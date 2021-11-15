class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit
  include Pagy::Backend
end
