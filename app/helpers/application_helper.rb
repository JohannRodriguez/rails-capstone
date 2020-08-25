module ApplicationHelper
  # rubocop:disable Style/GuardClause
  def generate_link(name, link_path)
    if current_page?(link_path)
      link_to name, link_path, class: 'nav_btn_highlight'
    else
      link_to name, link_path
    end
  end

  def generate_links_user_logged
    unless session[:current_user_id].nil?
      tag.div class: 'column nav_user_paths_loged' do
        concat(generate_link('PROFILE', user_path(id: session[:current_user_id])))
        concat(generate_link('FAVORITES', saved_articles_index_path(id: session[:current_user_id])))
        concat(generate_link('NEW ARTICLE', new_article_path))
        concat((link_to 'LOGOUT', delete_session_path, method: :delete))
      end
    end
  end

  def generate_link_no_user
    if session[:current_user_id].nil?
      tag.div class: 'column' do
        concat(generate_link('LOGIN', new_session_path))
        concat(content_tag(:p, '|'))
        concat(generate_link('REGISTER', new_user_path))
      end
    end
  end
  # rubocop:enable Style/GuardClause
end
