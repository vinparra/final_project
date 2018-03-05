class PlayersController < ApplicationController
  before_action :current_user_must_be_player_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_player_user
    player = Player.find(params[:id])

    unless current_user == player.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @players = Player.all

    render("players/index.html.erb")
  end

  def show
    @player = Player.find(params[:id])

    render("players/show.html.erb")
  end

  def new
    @player = Player.new

    render("players/new.html.erb")
  end

  def create
    @player = Player.new

    @player.name = params[:name]
    @player.team_id = params[:team_id]
    @player.position_id = params[:position_id]
    @player.user_id = params[:user_id]

    save_status = @player.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/players/new", "/create_player"
        redirect_to("/players")
      else
        redirect_back(:fallback_location => "/", :notice => "Player created successfully.")
      end
    else
      render("players/new.html.erb")
    end
  end

  def edit
    @player = Player.find(params[:id])

    render("players/edit.html.erb")
  end

  def update
    @player = Player.find(params[:id])

    @player.name = params[:name]
    @player.team_id = params[:team_id]
    @player.position_id = params[:position_id]
    @player.user_id = params[:user_id]

    save_status = @player.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/players/#{@player.id}/edit", "/update_player"
        redirect_to("/players/#{@player.id}", :notice => "Player updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Player updated successfully.")
      end
    else
      render("players/edit.html.erb")
    end
  end

  def destroy
    @player = Player.find(params[:id])

    @player.destroy

    if URI(request.referer).path == "/players/#{@player.id}"
      redirect_to("/", :notice => "Player deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Player deleted.")
    end
  end
end
