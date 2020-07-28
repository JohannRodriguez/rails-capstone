class UsersController < ApplicationController
  def index
    current_user = User.find_by_id(session[:current_user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.alert = 'User successfully created'
      redirect_to root_path
    else
      flash.alert = 'Invalid username'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
