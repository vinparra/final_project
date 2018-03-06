class RanksController < ApplicationController
  def index
    @q = Rank.ransack(params[:q])
    @ranks = @q.result(:distinct => true).includes(:player, :user).page(params[:page]).per(10)

    render("ranks/index.html.erb")
  end

  def show
    @rank = Rank.find(params[:id])

    render("ranks/show.html.erb")
  end

  def new
    @rank = Rank.new

    render("ranks/new.html.erb")
  end

  def create
    @rank = Rank.new

    @rank.user_id = params[:user_id]
    @rank.player_id = params[:player_id]

    save_status = @rank.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ranks/new", "/create_rank"
        redirect_to("/ranks")
      else
        redirect_back(:fallback_location => "/", :notice => "Rank created successfully.")
      end
    else
      render("ranks/new.html.erb")
    end
  end

  def edit
    @rank = Rank.find(params[:id])

    render("ranks/edit.html.erb")
  end

  def update
    @rank = Rank.find(params[:id])

    @rank.user_id = params[:user_id]
    @rank.player_id = params[:player_id]

    save_status = @rank.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ranks/#{@rank.id}/edit", "/update_rank"
        redirect_to("/ranks/#{@rank.id}", :notice => "Rank updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rank updated successfully.")
      end
    else
      render("ranks/edit.html.erb")
    end
  end

  def destroy
    @rank = Rank.find(params[:id])

    @rank.destroy

    if URI(request.referer).path == "/ranks/#{@rank.id}"
      redirect_to("/", :notice => "Rank deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rank deleted.")
    end
  end
end
