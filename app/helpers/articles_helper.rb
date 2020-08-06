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

  def author_edits
    if session[:current_user_id] == @article.author.id
      tag.div class: 'modify_article' do
        concat(content_tag(:p, (link_to 'Edit article', edit_article_path(id: @article.id))))
        concat(content_tag(:p, (link_to 'Delete article', delete_article_path(id: @article.id), method: :delete)))
      end
    end
  end

  def article_add_categories_html
    if session[:current_user_id] == @article.author.id
      tag.p class: 'add_category' do
        @category.each do |c|
          concat('| ')
          concat(add_category(c))
          concat(' ')
        end
      end
    end
  end

  private

  def add_category(category)
    return link_to category.name, categories_create_path(category_id: category.id, article_id: @article.id), method: :post if category.relate_categories.where(article_id: @article.id).empty? and @article.author_id == session[:current_user_id]

    link_to category.name, delete_category_path(id: category.id, article_id: @article.id), method: :delete
  end
  # rubocop:enable  Layout/LineLength
end
