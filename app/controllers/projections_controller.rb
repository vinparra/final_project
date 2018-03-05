class ProjectionsController < ApplicationController
  def index
    @projections = Projection.all

    render("projections/index.html.erb")
  end

  def show
    @projection = Projection.find(params[:id])

    render("projections/show.html.erb")
  end

  def new
    @projection = Projection.new

    render("projections/new.html.erb")
  end

  def create
    @projection = Projection.new

    @projection.player_id = params[:player_id]
    @projection.source = params[:source]
    @projection.year = params[:year]
    @projection.ab = params[:ab]
    @projection.hr = params[:hr]
    @projection.rbi = params[:rbi]
    @projection.sb = params[:sb]
    @projection.runs = params[:runs]
    @projection.avg = params[:avg]
    @projection.innings_pitched = params[:innings_pitched]
    @projection.wins = params[:wins]
    @projection.saves = params[:saves]
    @projection.era = params[:era]
    @projection.whip = params[:whip]
    @projection.strikeouts = params[:strikeouts]

    save_status = @projection.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projections/new", "/create_projection"
        redirect_to("/projections")
      else
        redirect_back(:fallback_location => "/", :notice => "Projection created successfully.")
      end
    else
      render("projections/new.html.erb")
    end
  end

  def edit
    @projection = Projection.find(params[:id])

    render("projections/edit.html.erb")
  end

  def update
    @projection = Projection.find(params[:id])

    @projection.player_id = params[:player_id]
    @projection.source = params[:source]
    @projection.year = params[:year]
    @projection.ab = params[:ab]
    @projection.hr = params[:hr]
    @projection.rbi = params[:rbi]
    @projection.sb = params[:sb]
    @projection.runs = params[:runs]
    @projection.avg = params[:avg]
    @projection.innings_pitched = params[:innings_pitched]
    @projection.wins = params[:wins]
    @projection.saves = params[:saves]
    @projection.era = params[:era]
    @projection.whip = params[:whip]
    @projection.strikeouts = params[:strikeouts]

    save_status = @projection.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projections/#{@projection.id}/edit", "/update_projection"
        redirect_to("/projections/#{@projection.id}", :notice => "Projection updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Projection updated successfully.")
      end
    else
      render("projections/edit.html.erb")
    end
  end

  def destroy
    @projection = Projection.find(params[:id])

    @projection.destroy

    if URI(request.referer).path == "/projections/#{@projection.id}"
      redirect_to("/", :notice => "Projection deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Projection deleted.")
    end
  end
end
