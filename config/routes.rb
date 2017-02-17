Rails.application.routes.draw do
  # Routes for the Box resource:
  # CREATE
  get "/boxes/new", :controller => "boxes", :action => "new"
  post "/create_box", :controller => "boxes", :action => "create"

  # READ
  get "/boxes", :controller => "boxes", :action => "index"
  get "/boxes/:id", :controller => "boxes", :action => "show"

  # UPDATE
  get "/boxes/:id/edit", :controller => "boxes", :action => "edit"
  post "/update_box/:id", :controller => "boxes", :action => "update"

  # DELETE
  get "/delete_box/:id", :controller => "boxes", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
