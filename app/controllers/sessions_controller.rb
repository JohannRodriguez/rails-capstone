class SessionsController < ApplicationController
  def create
    @user = User.find_by_name(params[:session][:name])
    if @user
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      flash.alert = 'Invalid username'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
