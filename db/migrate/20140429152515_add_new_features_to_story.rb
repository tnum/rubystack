class AddNewFeaturesToStory < ActiveRecord::Migration
  def change
  	# i want to add colums to the stories table
  	add_column :stories, :is_featured, :boolean, default: false
  	add_column :stories, :votes_count, :integer
  	add_column :stories, :comments_count, :integer
  end
end
