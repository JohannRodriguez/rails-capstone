module ArticlesHelper
  def vote
    @vote = Vote.where(user_id: session[:current_user_id], article_id: @article.id)
    if session[:current_user_id].nil?
      link_to 'Vote', new_session_path
    elsif !@vote.empty?
      link_to 'Unvote', delete_vote_path(id: @vote.first.id, article_id: @article.id), method: :delete
    else
      link_to 'Vote', votes_path(article_id: @article.id), method: :post
    end
  end

  def multiple_votes?
    return 'vote' if @article.votes.count == 1

    'votes'
  end

  def edit_article
    if @article.author_id == session[:current_user_id]
      link_to 'Edit article', edit_article_path(id: @article.id)
    end
  end

  def add_category(category)
    if @article.author_id == session[:current_user_id]
      if category.relatecategories.where(article_id: @article.id).empty?
        link_to category.name, categories_create_path(category_id: category.id, article_id: @article.id), method: :post
      else
        link_to category.name, delete_category_path(id: category.id, article_id: @article.id), method: :delete
      end
    end
  end

  def delete_article
    if @article.author_id == session[:current_user_id]
      link_to 'Delete article', delete_article_path(id: @article.id), method: :delete
    end
  end

  def save_article_show
    if session[:current_user_id].nil?
      link_to 'Save Article', new_session_path
    else
      link_to 'Save Article', save_articles_path(article_id: @article.id), method: :post
    end
  end
end
