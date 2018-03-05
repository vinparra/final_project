class HistoricalsController < ApplicationController
  def index
    @historicals = Historical.all

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
    @historical.ab = params[:ab]
    @historical.hr = params[:hr]
    @historical.rbi = params[:rbi]
    @historical.sb = params[:sb]
    @historical.runs = params[:runs]
    @historical.avg = params[:avg]
    @historical.innings_pitched = params[:innings_pitched]
    @historical.wins = params[:wins]
    @historical.saves = params[:saves]
    @historical.era = params[:era]
    @historical.whip = params[:whip]
    @historical.strikeouts = params[:strikeouts]

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
    @historical.ab = params[:ab]
    @historical.hr = params[:hr]
    @historical.rbi = params[:rbi]
    @historical.sb = params[:sb]
    @historical.runs = params[:runs]
    @historical.avg = params[:avg]
    @historical.innings_pitched = params[:innings_pitched]
    @historical.wins = params[:wins]
    @historical.saves = params[:saves]
    @historical.era = params[:era]
    @historical.whip = params[:whip]
    @historical.strikeouts = params[:strikeouts]

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
