class Car < ApplicationRecord
	has_many :registrations
	has_many :users, through: :registrations	
	has_many :posts, dependent: :destroy
end
