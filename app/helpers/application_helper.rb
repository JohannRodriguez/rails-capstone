module ApplicationHelper
  # rubocop:disable Layout/LineLength
  def username_display
    return link_to 'Profile', user_path(id: session[:current_user_id]) unless session[:current_user_id].nil?
  end

  def index_saved_articles
    return link_to 'Saved Articles', saved_articles_index_path(id: session[:current_user_id]) unless session[:current_user_id].nil?
  end

  def sign_up
    return link_to 'Sign Up', new_user_path if session[:current_user_id].nil?
  end

  def sign_in
    return link_to 'Sign In', new_session_path if session[:current_user_id].nil?
  end

  def logout
    return link_to 'Log out', delete_session_path, method: :delete unless session[:current_user_id].nil?
  end

  def new_article
    if session[:current_user_id].nil?
      link_to 'New_article', new_session_path
    else
      link_to 'New article', new_article_path
    end
  end
  # rubocop:enable Layout/LineLength
end
