module TwoFactorAuthenticationHelper
	require 'rqrcode'
	
	def qrcode(user)
	  issuer = 'outlet-dev' #TODO environment specific here
    label = "#{issuer}:#{current_user.email}"
byebug
    if user.encrypted_otp_secret.nil?
			user.encrypted_otp_secret = User.generate_otp_secret
			user.save!
		end
    qrcode = user.otp_provisioning_uri(label, issuer: issuer)
	end
end
