# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  before_action :set_cart

  def destroy
    super
    flash[ :notice ] = "Signed out successfully."
  end
end
