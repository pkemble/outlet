module TwoFactorAuthenticationHelper
	require 'rqrcode'
	
	def qrcode(user)
	  issuer = 'outlet-dev' #TODO environment specific here
    label = "#{issuer}:#{current_user.email}"
    if user.encrypted_otp_secret.nil?
      byebug
			user.encrypted_otp_secret = User.generate_otp_secret
			user.save!
		end
		byebug
    qrcode = user.otp_provisioning_uri(label, issuer: issuer)
	end
end
