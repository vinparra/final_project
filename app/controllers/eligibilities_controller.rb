class EligibilitiesController < ApplicationController
  def index
    @eligibilities = Eligibility.all

    render("eligibilities/index.html.erb")
  end

  def show
    @eligibility = Eligibility.find(params[:id])

    render("eligibilities/show.html.erb")
  end

  def new
    @eligibility = Eligibility.new

    render("eligibilities/new.html.erb")
  end

  def create
    @eligibility = Eligibility.new

    @eligibility.player_id = params[:player_id]
    @eligibility.position_id = params[:position_id]

    save_status = @eligibility.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/eligibilities/new", "/create_eligibility"
        redirect_to("/eligibilities")
      else
        redirect_back(:fallback_location => "/", :notice => "Eligibility created successfully.")
      end
    else
      render("eligibilities/new.html.erb")
    end
  end

  def edit
    @eligibility = Eligibility.find(params[:id])

    render("eligibilities/edit.html.erb")
  end

  def update
    @eligibility = Eligibility.find(params[:id])

    @eligibility.player_id = params[:player_id]
    @eligibility.position_id = params[:position_id]

    save_status = @eligibility.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/eligibilities/#{@eligibility.id}/edit", "/update_eligibility"
        redirect_to("/eligibilities/#{@eligibility.id}", :notice => "Eligibility updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Eligibility updated successfully.")
      end
    else
      render("eligibilities/edit.html.erb")
    end
  end

  def destroy
    @eligibility = Eligibility.find(params[:id])

    @eligibility.destroy

    if URI(request.referer).path == "/eligibilities/#{@eligibility.id}"
      redirect_to("/", :notice => "Eligibility deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Eligibility deleted.")
    end
  end
end
