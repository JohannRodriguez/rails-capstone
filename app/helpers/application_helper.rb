module ApplicationHelper
  def username_display
    if session[:current_user_id] != nil
      return User.find_by_id(session[:current_user_id]).name
    end
  end
end
