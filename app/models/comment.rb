class Comment < ActiveRecord::Base

	# associations
	# my  comment belongs to a storu
	belongs_to :story, counter_cache: true

	# add validations
	validates :body, Presence: true
end
