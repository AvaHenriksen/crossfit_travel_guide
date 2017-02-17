class BoxesController < ApplicationController
  def index
    @q = Box.ransack(params[:q])
    @boxes = @q.result(:distinct => true).includes(:bookmarks, :comments, :city, :visits).page(params[:page]).per(10)

    render("boxes/index.html.erb")
  end

  def show
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
