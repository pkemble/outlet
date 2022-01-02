class RegistrationsController < Devise::RegistrationsController
	require 'rqrcode'
  before_action :one_user_registered?, only: %i[new create]

  def edit
    if current_user.otp_required_for_login?
      @qrcode = helpers.qrcode(current_user)
    else
      @qrcode = 'foo'
    end
  end

  protected

  def one_user_registered?
    if User.count == 1
      if user_signed_in?
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end
  end
end
