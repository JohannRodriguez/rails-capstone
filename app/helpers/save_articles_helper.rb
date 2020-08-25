module SaveArticlesHelper
  def saved_article_title(article_record)
    if article_record.article_id.nil?
      'The article you are looking for was deleted'
    else
      link_to find_article(article_record).title, article_path(id: find_article(article_record).id)
    end
  end

  def favorite_link(article_record)
    if find_article(article_record).nil?
      articles_path
    else
      article_path(id: find_article(article_record).id)
    end
  end

  def saved_article_image(article_record)
    if article_record.article_id.nil?
      'https://i.ibb.co/YhBBFvR/anf2.jpg'
    else
      find_article(article_record).image
    end
  end

  def find_article(article_record)
    @article.find_by_id(article_record.article_id)
  end
end
