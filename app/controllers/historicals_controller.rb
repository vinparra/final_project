class HistoricalsController < ApplicationController
  def index
    @q = Historical.ransack(params[:q])
    @historicals = @q.result(:distinct => true).includes(:player).page(params[:page]).per(10)

    render("historicals/index.html.erb")
  end

  def show
    @historical = Historical.find(params[:id])

    render("historicals/show.html.erb")
  end

  def new
    @historical = Historical.new

    render("historicals/new.html.erb")
  end

  def create
    @historical = Historical.new

    @historical.player_id = params[:player_id]
    @historical.source = params[:source]
    @historical.year = params[:year]
    @historical.at_bats = params[:at_bats]
    @historical.home_runs = params[:home_runs]
    @historical.runs_batted_in = params[:runs_batted_in]
    @historical.stolen_bases = params[:stolen_bases]
    @historical.runs = params[:runs]
    @historical.avg = params[:avg]
    @historical.innings_pitched = params[:innings_pitched]
    @historical.wins = params[:wins]
    @historical.saves = params[:saves]
    @historical.era = params[:era]
    @historical.whip = params[:whip]
    @historical.strikeouts = params[:strikeouts]
    @historical.hits = params[:hits]
    @historical.on_base_percentage = params[:on_base_percentage]
    @historical.slugging_percentage = params[:slugging_percentage]
    @historical.on_base_plus_slugging = params[:on_base_plus_slugging]

    save_status = @historical.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/historicals/new", "/create_historical"
        redirect_to("/historicals")
      else
        redirect_back(:fallback_location => "/", :notice => "Historical created successfully.")
      end
    else
      render("historicals/new.html.erb")
    end
  end

  def edit
    @historical = Historical.find(params[:id])

    render("historicals/edit.html.erb")
  end

  def update
    @historical = Historical.find(params[:id])

    @historical.player_id = params[:player_id]
    @historical.source = params[:source]
    @historical.year = params[:year]
    @historical.at_bats = params[:at_bats]
    @historical.home_runs = params[:home_runs]
    @historical.runs_batted_in = params[:runs_batted_in]
    @historical.stolen_bases = params[:stolen_bases]
    @historical.runs = params[:runs]
    @historical.avg = params[:avg]
    @historical.innings_pitched = params[:innings_pitched]
    @historical.wins = params[:wins]
    @historical.saves = params[:saves]
    @historical.era = params[:era]
    @historical.whip = params[:whip]
    @historical.strikeouts = params[:strikeouts]
    @historical.hits = params[:hits]
    @historical.on_base_percentage = params[:on_base_percentage]
    @historical.slugging_percentage = params[:slugging_percentage]
    @historical.on_base_plus_slugging = params[:on_base_plus_slugging]

    save_status = @historical.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/historicals/#{@historical.id}/edit", "/update_historical"
        redirect_to("/historicals/#{@historical.id}", :notice => "Historical updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Historical updated successfully.")
      end
    else
      render("historicals/edit.html.erb")
    end
  end

  def destroy
    @historical = Historical.find(params[:id])

    @historical.destroy

    if URI(request.referer).path == "/historicals/#{@historical.id}"
      redirect_to("/", :notice => "Historical deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Historical deleted.")
    end
  end
end
