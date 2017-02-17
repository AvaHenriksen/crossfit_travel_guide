Rails.application.routes.draw do
  # Routes for the Bookmark resource:
  # CREATE
  get "/bookmarks/new", :controller => "bookmarks", :action => "new"
  post "/create_bookmark", :controller => "bookmarks", :action => "create"

  # READ
  get "/bookmarks", :controller => "bookmarks", :action => "index"
  get "/bookmarks/:id", :controller => "bookmarks", :action => "show"

  # UPDATE
  get "/bookmarks/:id/edit", :controller => "bookmarks", :action => "edit"
  post "/update_bookmark/:id", :controller => "bookmarks", :action => "update"

  # DELETE
  get "/delete_bookmark/:id", :controller => "bookmarks", :action => "destroy"
  #------------------------------

  # Routes for the Food_option resource:
  # CREATE
  get "/food_options/new", :controller => "food_options", :action => "new"
  post "/create_food_option", :controller => "food_options", :action => "create"

  # READ
  get "/food_options", :controller => "food_options", :action => "index"
  get "/food_options/:id", :controller => "food_options", :action => "show"

  # UPDATE
  get "/food_options/:id/edit", :controller => "food_options", :action => "edit"
  post "/update_food_option/:id", :controller => "food_options", :action => "update"

  # DELETE
  get "/delete_food_option/:id", :controller => "food_options", :action => "destroy"
  #------------------------------

  # Routes for the City resource:
  # CREATE
  get "/cities/new", :controller => "cities", :action => "new"
  post "/create_city", :controller => "cities", :action => "create"

  # READ
  get "/cities", :controller => "cities", :action => "index"
  get "/cities/:id", :controller => "cities", :action => "show"

  # UPDATE
  get "/cities/:id/edit", :controller => "cities", :action => "edit"
  post "/update_city/:id", :controller => "cities", :action => "update"

  # DELETE
  get "/delete_city/:id", :controller => "cities", :action => "destroy"
  #------------------------------

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
