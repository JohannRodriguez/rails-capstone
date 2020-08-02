class SaveArticlesController < ApplicationController
  def index
    @user = User.find_by_id(session[:current_user_id])
    @article = Article.all
  end

  def create
    @user = User.find_by_id(session[:current_user_id])
    if @user.saved_articles.new(article_id: params[:article_id]).save
      redirect_to category_path(id: params[:category]) unless params[:category].nil?
      redirect_to article_path(params[:article_id]) if params[:category].nil?
      flash.alert = 'Article succesfully saved'
    else
      flash.alert = "Article wasn't saved"
    end
  end

  def destroy
    @saved_article = SaveArticle.find_by_id(params[:id])
    if @saved_article.destroy
      redirect_to category_path(id: params[:category]) unless params[:category].nil?
      redirect_to saved_articles_index_path(id: session[:current_user_id]) if params[:category].nil?
      flash.alert = "Your saved article was deleted"
    else
      flash.alert = "You still have the article D:"
    end
  end
end
