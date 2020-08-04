module ArticlesHelper
  # rubocop:disable  Layout/LineLength
  def vote
    @vote = Vote.where(user_id: session[:current_user_id], article_id: @article.id)
    if session[:current_user_id].nil?
      link_to (fa_icon 'star'), new_session_path, class: 'vote_highlight'
    elsif !@vote.empty?
      link_to (fa_icon 'star'), delete_vote_path(id: @vote.first.id, article_id: @article.id), method: :delete, class: 'vote_shadow'
    else
      link_to (fa_icon 'star'), votes_path(article_id: @article.id), method: :post, class: 'vote_highlight'
    end
  end

  def multiple_votes?
    return 'vote' if @article.votes.count == 1

    'votes'
  end

  def add_category(category)
    return link_to category.name, categories_create_path(category_id: category.id, article_id: @article.id), method: :post if category.relate_categories.where(article_id: @article.id).empty? and @article.author_id == session[:current_user_id]

    link_to category.name, delete_category_path(id: category.id, article_id: @article.id), method: :delete
  end

  def save_article_show
    return link_to (fa_icon 'heart'), new_session_path, class: 'favorite_highlight' if session[:current_user_id].nil?

    @favorite = @user.saved_articles.where(article_id: @article.id)
    if !@favorite.empty?
      link_to (fa_icon 'heart'), save_article_path(id: @favorite.first.id, article_id: @article.id), method: :delete, class: 'favorite_shadow'
    else
      link_to (fa_icon 'heart'), save_articles_path(article_id: @article.id), method: :post, class: 'favorite_highlight'
    end
  end

  def button_message
    if current_page?(controller: 'articles', action: 'new')
      'CREATE ARTICLE'
    elsif current_page?(controller: 'articles', action: 'edit')
      'EDIT ARTICLE'
    end
  end
  # rubocop:enable  Layout/LineLength
end
