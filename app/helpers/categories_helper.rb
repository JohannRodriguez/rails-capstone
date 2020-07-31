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
      link_to 'Vote', new_session_path
    elsif !@vote.empty?
      link_to 'Unvote', delete_vote_path(id: @vote.first.id, article_id: article.id, category_id: @category.id), method: :delete
    else
      link_to 'Vote', votes_path(article_id: article.id, category_id: @category.id), method: :post
    end
  end

  def category_votes(article)
    return 'vote' if article.votes.count == 1

    'votes'
  end
end
