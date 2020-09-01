class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :follows, dependent: :destroy
	has_many :registrations
	has_many :cars, through: :registrations			
	has_secure_password
end
