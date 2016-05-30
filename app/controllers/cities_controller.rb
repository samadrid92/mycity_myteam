class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(city_params)
    redirect_to city_path(@city)
  end

  def show
    @city = City.find_by_id(params[:id])
  end

  def edit
    @city = City.find_by_id(params[:id])
  end

  def update
    @city = City.find_by_id(params[:id])
    @city.update(city_params)
    redirect_to city_path(@city)
  end

  private

  def city_params
    params.require(:city).permit(:city_name, :date_founded, :population, :nicknames, :header_pic)
  end


end
