module SaveArticlesHelper
  def saved_article_title(article_record)
    if article_record.article_id.nil?
      'The article you are looking for was deleted'
    else
      link_to find_article(article_record).title, article_path(id: find_article(article_record).id)
    end
  end

  def saved_article_image(article_record)
    return find_article(article_record).image unless article_record.article_id.nil?
  end

  def find_article(article_record)
    @article.find_by_id(article_record.article_id)
  end
end
