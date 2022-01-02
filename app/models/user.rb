class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable,
			   :two_factor_authenticatable, :otp_secret_encryption_key => ENV['OTP_SECRET_KEY']

	has_many :posts
end
