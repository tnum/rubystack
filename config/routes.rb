Rails.application.routes.draw do

# active admin auto added these two lines
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # we want the ability to be able to add, edit, delete stories
  resources :stories do

  	# comments are related to stories
  	# so the URLs will be related too
  	resources :comments

    # votes are also related to stories
    resources :votes

  end

  # set up a URL for the home page
  root "stories#index"

end
