 class StoriesController < ApplicationController

	# we want to add a list of all the stories
	# in static websites, this is the index.html

	def index

		# I want to pass some data to our HTML
		# This data is variable
		# So we store the data as a variable
		@username = "teenum"

		# We want to store some stories in a list
		# in ruby, we call this an array
		# @stories = ["Google", "Facebook", "Twitter", "Linkedin"]

		# we want to get the real stories from the database
		# @stories = Story.order("votes_count desc, title asc")

		if params[:featureed] == "true"
			#find the featured stories
			@stories = Story.where(is_featured: true).order("created_at desc")

		elsif params[:sort] == "recent"
			# sort by recent
			@stories = Story.order("created_at desc")
		else
			# sort by top
			@stories = Story.order("votes_count desc, title desc")
			
		end

	end

	def show
		# read more page
		# params get extra information from forms and URLs
		@story = Story.find(params[:id])
	end

	def new
		# this is our new story form
		@story = Story.new
	end

	def create
		# actually add things to the database - but we are going to hard code this in for now
		# @story = Story.new(title: "Steer", description: "A code school", link: "http://steer.me")
		@story = Story.new(story_params)

		# save to the database
		if @story.save

			# let the user know it was successful
			flash[:sucess] = "Your story was added"

			# i want to go back to the homepage after save
			redirect_to root_path

		else

			# this hasn't saved to the database 
			# because it will have failed validations
			# so let's show the add a story form
			render "new"

		end
	end

	def edit
		# this is the form to edit the story
		@story = Story.find(params[:id])
	end

	def update
		# this is actually updating the database using form data
		@story = Story.find(params[:id])

		# update this story based on the form data
		if @story.update(story_params)

			# let the user know 
			flash[:sucess] = "You've edited the story"
			# go back to the induvidual page
			redirect_to story_path(@story)

		else

			# show the edit for if it didn't update
			render "edit"

		end
	end

	def destroy
		# actually delete the story from teh database
		@story = Story.find(params[:id])

		# remove from the database
		@story.destroy

		# let the user know
		flash[:sucess] = "You've deleted this story"

		# redirect back to the homepage
		redirect_to root_path
	end

	def story_params

		# find the data from the form
		params.require(:story).permit(:title, :description, :link)
	end

end
