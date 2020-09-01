class Post < ApplicationRecord
	belongs_to :user
	belongs_to :car
	has_many :follows, dependent: :destroy
	has_many :comments, dependent: :destroy
end
