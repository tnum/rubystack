class VotesController < ApplicationController
	
	def create

		# actually create a vote
		# find the story we are talking about
		@story = Story.find(params[:story_id])

		# make a new vote on this story
		@vote = @story.votes.new

		@vote.save

		flash[:sucess] = "You have voted this story up"

		redirect_to story_path(@story)
	
	end

end
