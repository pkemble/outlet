class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
    devise_parameter_sanitizer.permit(:account_update, keys: [:otp_required_for_login])
  end
  
  def generate_two_factor_secret_if_missing!
    return unless otp_secret.nil?
    update!(otp_secret: User.generate_otp_secret)
  end
  
  def enable_two_factor!
    update!(otp_required_for_login: true)
  end
  
  def two_factor_qr_code_uri
    issuer = 'outlet-dev' #TODO environment specific here
    label = "#{issuer}:#{current_user.email}"

    otp_provisioning_uri(label, issuer: issuer)
  end
  
  def two_factor_backup_codes_generated?
    otp_backup_codes.present?
  end
end
