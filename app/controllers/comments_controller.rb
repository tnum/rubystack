class CommentsController < ApplicationController

	def new
		# this is the coment form
		# find the story that the comment will be on
		@story = Story.find(params[:story_id])

		#make a new comment on this @story variable
		@comment = @story.comments.new
		
	end

	def create
		# this is actually creating a comment
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		# if the comment saves, go back to story page
		# if not, show new form again
		if @comment.save
			flash[:success] = "Your comment was added"
			redirect_to story_path(@story)
		else
			render "new"
		end
	end

	def comment_params
		# whitelisted form data
		params.require(:comment).permit(:body)
	end
	
end
