module CategoriesHelper
  # rubocop:disable Layout/LineLength
  def latest_category_article_title(category)
    if !category.articles.length.positive?
      'No articles found for this category'
    else
      category.articles.order('created_at').last.title
    end
  end

  def latest_category_article_image(category)
    return 'https://i.ibb.co/YhBBFvR/anf2.jpg' unless category.articles.length.positive?

    category.articles.order('created_at').last.image
  end

  def latest_category_article_name(category)
    return '' unless category.articles.length.positive?

    category.articles.order('created_at').last.author.name
  end

  def category_article_vote(article)
    @vote = Vote.find_vote(session[:current_user_id], article)
    if session[:current_user_id].nil?
      link_to (fa_icon 'star'), new_session_path, class: 'vote_highlight'
    elsif !@vote.empty?
      link_to (fa_icon 'star'), delete_vote_path(id: @vote.first.id, article_id: article.id, category_id: @category.id), method: :delete, class: 'vote_shadow'
    else
      link_to (fa_icon 'star'), votes_path(article_id: article.id, category_id: @category.id), method: :post, class: 'vote_highlight'
    end
  end

  def category_save_article(article)
    return link_to (fa_icon 'heart'), new_session_path, class: 'favorite_highlight' if session[:current_user_id].nil?

    @favorite = @user.saved_articles.where(article_id: article.id)
    if !@favorite.empty?
      link_to (fa_icon 'heart'), save_article_path(id: @favorite.first.id, category: params[:id]), method: :delete, class: 'favorite_shadow'
    else
      link_to (fa_icon 'heart'), save_articles_path(article_id: article.id, category: params[:id]), method: :post, class: 'favorite_highlight'
    end
  end

  def category_votes(article)
    return 'vote' if article.votes.count == 1

    'votes'
  end
  # rubocop:enable Layout/LineLength
end
