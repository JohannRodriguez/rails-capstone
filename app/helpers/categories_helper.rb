module CategoriesHelper
  def latest_category_article(category)
    if !category.articles.length.positive?
      "No articles found for this category"
    else
      category.articles.order("created_at").last.title
    end
  end

  def latest_category_article_image(category)
     return category.articles.order("created_at").last.image if category.articles.length.positive?
  end

  def category_article_vote(article)
    @vote = Vote.where(user_id: session[:current_user_id], article_id: article.id)
    if session[:current_user_id].nil?
      link_to (fa_icon "star") , new_session_path, class: 'vote_highlight'
    elsif !@vote.empty?
      link_to (fa_icon "star"), delete_vote_path(id: @vote.first.id, article_id: article.id, category_id: @category.id), method: :delete, class: 'vote_shadow'
    else
      link_to (fa_icon "star") , votes_path(article_id: article.id, category_id: @category.id), method: :post, class: 'vote_highlight'
    end
  end

  def category_save_article(article)
    return link_to (fa_icon "heart"), new_session_path, class: 'favorite_highlight' if session[:current_user_id].nil?
    @favorite = @user.saved_articles.where(article_id: article.id)
    if !@favorite.empty?
      link_to (fa_icon "heart"), save_article_path(id: @favorite.first.id, category: params[:id]), method: :delete, class: 'favorite_shadow'
    else
      link_to (fa_icon "heart"), save_articles_path(article_id: article.id, category: params[:id]), method: :post, class: 'favorite_highlight'
    end
  end

  def category_votes(article)
    return 'vote' if article.votes.count == 1

    'votes'
  end
end
