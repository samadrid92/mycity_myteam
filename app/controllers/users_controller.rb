class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by_id(params[:id])

  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :current_city, :username, :email, :password, :password_confirmation)
  end

end
