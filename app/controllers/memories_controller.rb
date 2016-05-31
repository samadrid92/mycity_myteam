class MemoriesController < ApplicationController
  before_action :set_team

  def index
    @memories = Memory.all
  end

  def show
  end

  def new
    @memory = Memory.new
  end

  def create
    @team = @city.teams.find_by_id(params[:team_id])
    @memory = @team.memories.new(memories_params)
    @memory.user_id = current_user.id
    if @memory.save
      redirect_to city_team_path(@city, @team)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_team
      @city = City.find(params[:city_id])
      @team = @city.teams.find_by_id(params[:team_id])
  end

  def memories_params
    params.require(:memory).permit(:name, :description, :age, :date, :hometown, :team_id, :user_id)
  end

end
