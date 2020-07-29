class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find_by_id(session[:current_user_id])
    if @user.articles.build(user_params).save
      flash.alert = 'article created'
      redirect_to root_path
    else
      flash.alert = 'Invalid fields'
      redirect_to new_article_path
    end
  end

  private

  def user_params
    params.require(:article).permit(:title, :text)
  end
end
