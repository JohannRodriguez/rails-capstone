module HomeHelper
  # rubocop:disable Layout/LineLength
  def index_latest_category_article(category)
    if !category.articles.length.positive?
      'No articles found for this category'
    else
      category.articles.order('created_at').last.title
    end
  end

  def index_latest_category_article_image(category)
    if category.priority <= 2 and category.articles.length.positive?
      category.articles.order('created_at').last.image
    else
      'https://i.ibb.co/YhBBFvR/anf2.jpg'
    end
  end

  def feautured_category_article_title
    if feautured_article.nil?
      'There is no featured article this week'
    else
      feautured_article.title
    end
  end

  def feautured_category_article_image
    if feautured_article.nil?
      'https://i.ibb.co/YhBBFvR/anf2.jpg'
    else
      feautured_article.image
    end
  end

  def feautured_category_path
    if !feautured_article.nil?
      article_path(id: @week_article.id)
    elsif !feautured_category.nil?
      category_path(id: @week_category.id)
    else
      categories_path
    end
  end

  def feautured_category_name
    if feautured_category.nil?
      'There is no feautured category this week'
    else
      feautured_category.name
    end
  end

  def most_voted_article_title
    if Vote.all.empty?
      'There are no votes on any article'
    else
      most_voted_article.title
    end
  end

  def most_voted_article_image
    if Vote.all.empty?
      'https://i.ibb.co/YhBBFvR/anf2.jpg'
    else
      Article.find_by_id(@most_votes[0]).image
    end
  end

  def most_voted_article_path
    return articles_path if Vote.all.empty?

    article_path(id: most_voted_article.id)
  end
  # rubocop:disable Style/GuardClause

  private

  def most_voted_article
    @most_votes = Vote.find_most_voted
    Article.find_by_id(@most_votes[0])
  end

  def feautured_category
    unless RelateCategory.all.empty?
      @week_category_record = RelateCategory.find_weeks_category
      @week_category = Category.find_by_id(@week_category_record[0])
    end
  end

  def feautured_article
    @week_category = feautured_category
    @week_article = @week_category.articles.find_weeks_article unless @week_category.nil?
  end
  # rubocop:enable Style/GuardClause
  # rubocop:enable Layout/LineLength
end
