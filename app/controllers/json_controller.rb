class JsonController < ApplicationController
  def memories
    @city = City.find_by_id(params[:city_id])
    @team = @city.teams.find_by_id(params[:team_id])
    @memory = @team.memories.all
    render json: @memory
  end
end
