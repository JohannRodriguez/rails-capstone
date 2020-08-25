module UsersHelper
  def user_index_votes(article)
    return 'vote' if article.votes.count == 1

    'votes'
  end

  def category_name(category)
    category.name
  end
end
