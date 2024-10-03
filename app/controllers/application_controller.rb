class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    flash[:alert] = "The user can not be found"
    redirect_to users_path
  end
end
