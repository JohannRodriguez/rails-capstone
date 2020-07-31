module HomeHelper
  def most_voted_article_title
    if Vote.all.empty?
      'There are no votes in any article'
    else
      most_voted_article.title
    end
  end

  def most_voted_article_img
    return most_voted_article.image unless Vote.all.empty?
  end

  def category_name_display(category)
    return link_to category.name, category_path(id: category.id) if category.priority <= 2
  end

  def index_latest_category_article(category)
    if category.priority <= 2
      if !category.articles.length.positive?
        "No articles found for this category"
      else
        category.articles.order("created_at").last.title
      end
    end
  end

  def index_latest_category_article_image(category)
    if category.priority <= 2 and category.articles.length.positive?
      category.articles.order("created_at").last.image
    end
  end

  private

  def most_voted_article
    @most_votes = Vote.group(:article_id).order(count_all: :desc).count.first
    return Article.find_by_id(@most_votes[0])
  end
end
