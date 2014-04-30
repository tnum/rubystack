class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

    	# I want to link the comment table with a story
    	t.integer :story_id

    	# we want to save the comment as paragraphs
    	# not a string but a text column
    	t.text :body

      t.timestamps
    end
  end
end
