class CitiesController < ApplicationController
  def index
    @q = City.ransack(params[:q])
    @cities = @q.result(:distinct => true).includes(:boxes, :food_options).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@cities.where.not(:location_latitude => nil)) do |city, marker|
      marker.lat city.location_latitude
      marker.lng city.location_longitude
      marker.infowindow "<h5><a href='/cities/#{city.id}'>#{city.name}</a></h5><small>#{city.location_formatted_address}</small>"
    end

    render("cities/index.html.erb")
  end

  def show
    @food_option = FoodOption.new
    @box = Box.new
    @city = City.find(params[:id])

    render("cities/show.html.erb")
  end

  def new
    @city = City.new

    render("cities/new.html.erb")
  end

  def create
    @city = City.new

    @city.name = params[:name]
    @city.location = params[:location]

    save_status = @city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cities/new", "/create_city"
        redirect_to("/cities")
      else
        redirect_back(:fallback_location => "/", :notice => "City created successfully.")
      end
    else
      render("cities/new.html.erb")
    end
  end

  def edit
    @city = City.find(params[:id])

    render("cities/edit.html.erb")
  end

  def update
    @city = City.find(params[:id])

    @city.name = params[:name]
    @city.location = params[:location]

    save_status = @city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cities/#{@city.id}/edit", "/update_city"
        redirect_to("/cities/#{@city.id}", :notice => "City updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "City updated successfully.")
      end
    else
      render("cities/edit.html.erb")
    end
  end

  def destroy
    @city = City.find(params[:id])

    @city.destroy

    if URI(request.referer).path == "/cities/#{@city.id}"
      redirect_to("/", :notice => "City deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "City deleted.")
    end
  end
end
