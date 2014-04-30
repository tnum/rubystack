class Story < ActiveRecord::Base

	# associations
	# my story has many comments
	has_many :comments
	has_many :votes

	# I want to check the data is what I expect
	validates :title, presence: true, length: { minimum: 5}
	validates :description, presence: true
	validates :link, presence: true, uniqueness: {message: "has already been submitted"}


end
