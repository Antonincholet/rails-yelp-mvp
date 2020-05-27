class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.valid?
      @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
     params.require(:restaurant).permit(:name, :address,:category, :rating)
  end

end
