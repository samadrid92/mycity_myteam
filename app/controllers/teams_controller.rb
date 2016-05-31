class TeamsController < ApplicationController

  before_action :set_city
  before_action :find_team, only: [:show, :index]

  def index
    @teams = Team.all
  end

  def show
    @team = @city.teams.find_by_id(params[:team_id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = @city.teams.new(team_params)
    @team.city_id = @city.id
    if @team.save
      redirect_to city_teams_path(@city, @team)
    else
      redirect_to root_path
    end
  end

  def edit
    @team = @city.teams.find_by_id(params[:team_id])
    # @city = City.find_by_id(@team.city_id)
  end

  def update
    @team = @city.teams.find_by_id(params[:team_id])
    @team.update(team_params)
    redirect_to city_teams_path(@city, @team)
  end

  def destroy
    @team = @city.teams.find_by_id(params[:team_id])
    if @team.destroy
      redirect_to city_teams_path(@city, @team)
    else
      redirect_to root_path
    end
  end



  private

    def set_city
      @city = City.find(params[:city_id])
    end

    def team_params
      params.require(:team).permit(:team_name, :date_founded, :colors, :total_championships, :history, :venue, :city_id)
    end

    def find_team
    # This assumes you have an association set up as needed
      @team = Team.find_by_id(params[:id])

      # if @team.nil?
      #   redirect_to root_path
      # end
    end
end
