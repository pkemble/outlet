class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
    devise_parameter_sanitizer.permit(:account_update, keys: [:otp_required_for_login])
  end
end
