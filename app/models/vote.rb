class Vote < ActiveRecord::Base

	# association
	belongs_to :story, counter_cache: true

end
