class VotesController < ApplicationController
	
	def create

		# actually create a vote
		# find the story we are talking about
		@story = Story.find(params[:story_id])

		# make a new vote on this story
		@vote = @story.votes.new

		# save the ip address to the vote
		@vote.ip_address = request.ip

		if @vote.save

		    flash[:sucess] = "You have voted this story up"

		else

			flash[:error] = "You can't vote up twice"

		end

		redirect_to story_path(@story)
	
	end

end
