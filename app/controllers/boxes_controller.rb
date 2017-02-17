class BoxesController < ApplicationController
  def index
    @q = Box.ransack(params[:q])
    @boxes = @q.result(:distinct => true).includes(:bookmarks, :comments, :photos, :city, :visits).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@boxes.where.not(:address_latitude => nil)) do |box, marker|
      marker.lat box.address_latitude
      marker.lng box.address_longitude
      marker.infowindow "<h5><a href='/boxes/#{box.id}'>#{box.city_id}</a></h5><small>#{box.address_formatted_address}</small>"
    end

    render("boxes/index.html.erb")
  end

  def show
    @photo = Photo.new
    @comment = Comment.new
    @bookmark = Bookmark.new
    @box = Box.find(params[:id])

    render("boxes/show.html.erb")
  end

  def new
    @box = Box.new

    render("boxes/new.html.erb")
  end

  def create
    @box = Box.new

    @box.city_id = params[:city_id]
    @box.details = params[:details]
    @box.name = params[:name]
    @box.address = params[:address]

    save_status = @box.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/boxes/new", "/create_box"
        redirect_to("/boxes")
      else
        redirect_back(:fallback_location => "/", :notice => "Box created successfully.")
      end
    else
      render("boxes/new.html.erb")
    end
  end

  def edit
    @box = Box.find(params[:id])

    render("boxes/edit.html.erb")
  end

  def update
    @box = Box.find(params[:id])

    @box.city_id = params[:city_id]
    @box.details = params[:details]
    @box.name = params[:name]
    @box.address = params[:address]

    save_status = @box.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/boxes/#{@box.id}/edit", "/update_box"
        redirect_to("/boxes/#{@box.id}", :notice => "Box updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Box updated successfully.")
      end
    else
      render("boxes/edit.html.erb")
    end
  end

  def destroy
    @box = Box.find(params[:id])

    @box.destroy

    if URI(request.referer).path == "/boxes/#{@box.id}"
      redirect_to("/", :notice => "Box deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Box deleted.")
    end
  end
end
