# frozen_string_literal: true

class Admins::RegistrationsController < RegistrationsController
  def new
    redirect_to new_admin_session_path
  end

  def create
    redirect_to new_admin_session_path
  end
end
