class FoodOptionsController < ApplicationController
  def index
    @food_options = FoodOption.page(params[:page]).per(10)

    render("food_options/index.html.erb")
  end

  def show
    @comment = Comment.new
    @bookmark = Bookmark.new
    @food_option = FoodOption.find(params[:id])

    render("food_options/show.html.erb")
  end

  def new
    @food_option = FoodOption.new

    render("food_options/new.html.erb")
  end

  def create
    @food_option = FoodOption.new

    @food_option.city_id = params[:city_id]
    @food_option.details = params[:details]

    save_status = @food_option.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_options/new", "/create_food_option"
        redirect_to("/food_options")
      else
        redirect_back(:fallback_location => "/", :notice => "Food option created successfully.")
      end
    else
      render("food_options/new.html.erb")
    end
  end

  def edit
    @food_option = FoodOption.find(params[:id])

    render("food_options/edit.html.erb")
  end

  def update
    @food_option = FoodOption.find(params[:id])

    @food_option.city_id = params[:city_id]
    @food_option.details = params[:details]

    save_status = @food_option.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_options/#{@food_option.id}/edit", "/update_food_option"
        redirect_to("/food_options/#{@food_option.id}", :notice => "Food option updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Food option updated successfully.")
      end
    else
      render("food_options/edit.html.erb")
    end
  end

  def destroy
    @food_option = FoodOption.find(params[:id])

    @food_option.destroy

    if URI(request.referer).path == "/food_options/#{@food_option.id}"
      redirect_to("/", :notice => "Food option deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Food option deleted.")
    end
  end
end
