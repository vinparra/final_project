Rails.application.routes.draw do
  # Routes for the Ranking resource:
  # CREATE
  get "/rankings/new", :controller => "rankings", :action => "new"
  post "/create_ranking", :controller => "rankings", :action => "create"

  # READ
  get "/rankings", :controller => "rankings", :action => "index"
  get "/rankings/:id", :controller => "rankings", :action => "show"

  # UPDATE
  get "/rankings/:id/edit", :controller => "rankings", :action => "edit"
  post "/update_ranking/:id", :controller => "rankings", :action => "update"

  # DELETE
  get "/delete_ranking/:id", :controller => "rankings", :action => "destroy"
  #------------------------------

  # Routes for the Historical resource:
  # CREATE
  get "/historicals/new", :controller => "historicals", :action => "new"
  post "/create_historical", :controller => "historicals", :action => "create"

  # READ
  get "/historicals", :controller => "historicals", :action => "index"
  get "/historicals/:id", :controller => "historicals", :action => "show"

  # UPDATE
  get "/historicals/:id/edit", :controller => "historicals", :action => "edit"
  post "/update_historical/:id", :controller => "historicals", :action => "update"

  # DELETE
  get "/delete_historical/:id", :controller => "historicals", :action => "destroy"
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get "/teams/new", :controller => "teams", :action => "new"
  post "/create_team", :controller => "teams", :action => "create"

  # READ
  get "/teams", :controller => "teams", :action => "index"
  get "/teams/:id", :controller => "teams", :action => "show"

  # UPDATE
  get "/teams/:id/edit", :controller => "teams", :action => "edit"
  post "/update_team/:id", :controller => "teams", :action => "update"

  # DELETE
  get "/delete_team/:id", :controller => "teams", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Player resource:
  # CREATE
  get "/players/new", :controller => "players", :action => "new"
  post "/create_player", :controller => "players", :action => "create"

  # READ
  get "/players", :controller => "players", :action => "index"
  get "/players/:id", :controller => "players", :action => "show"

  # UPDATE
  get "/players/:id/edit", :controller => "players", :action => "edit"
  post "/update_player/:id", :controller => "players", :action => "update"

  # DELETE
  get "/delete_player/:id", :controller => "players", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
