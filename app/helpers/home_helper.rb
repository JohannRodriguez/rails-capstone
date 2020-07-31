module HomeHelper
  def most_voted_article_name
    link_to most_voted_article.title, article_path(id: most_voted_article.id)
  end

  def most_voted_article_img
    most_voted_article.image
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
    @most_voted = 0
    @displayed_article = nil
    @article.order("created_at").each do |a|
      if a.votes.count >= @most_voted
        @most_voted = a.votes.count
        @displayed_article = a
      end
    end
    @displayed_article
  end
end
