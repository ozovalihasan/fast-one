# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :set_cart
end
