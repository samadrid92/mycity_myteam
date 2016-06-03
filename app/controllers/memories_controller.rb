class MemoriesController < ApplicationController
  before_action :set_team
  before_action :find_memory

  def index
    @memories = Memory.all
    @memory = Memory.find_by_id(params[:memory_id])
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
    @team = @city.teams.find_by_id(params[:team_id])
    @memory = @team.memories.find_by_id(params[:memory_id])
  end

  # creates a whole new memory with edited version(must fix)
  def update
    @city = City.find(params[:city_id])
    @team = @city.teams.find_by_id(params[:team_id])
    @memory = @team.memories.find_by_id(params[:memory_id])
    if @memory.update(memories_params)
      redirect_to city_team_path(@city, @team)
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = current_user
    @team = @city.teams.find_by_id(params[:team_id])
    @memory = @team.memories.find_by_id(params[:memory_id])
    if @memory.destroy
      redirect_to city_team_path(@city, @team)
    else
      redirect_to root_path
    end
  end

  private

  def set_team
      @city = City.find(params[:city_id])
      @team = @city.teams.find_by_id(params[:team_id])
  end

  def memories_params
    params.require(:memory).permit(:name, :description, :age, :date, :hometown, :team_id, :user_id)
  end

  def find_memory
  # This assumes you have an association set up as needed
    @memory = Memory.find_by_id(params[:id])
  end

end
