class Car < ApplicationRecord
	has_many :registrations
	has_many :users, through: :registrations	

end
