module UsersHelper
  def user_index_votes(article)
    return 'vote' if article.votes.count == 1

    'votes'
  end

  def profile_article_place(index)
    if index.zero?
      'profile_second_article'
    else
      'profile_article'
    end
  end

  def category_name(category)
    category.name
  end
end
