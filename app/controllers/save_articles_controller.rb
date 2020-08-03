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
      flash.alert = 'Article added to your favorites'
    else
      flash.alert = "Something went wrong adding to favorites"
    end
  end

  def destroy
    @saved_article = SaveArticle.find_by_id(params[:id])
    if @saved_article.destroy
      if !params[:category].nil?
        redirect_to category_path(id: params[:category])
      elsif !params[:article_id].nil?
        redirect_to article_path(params[:article_id])
      else
      redirect_to saved_articles_index_path(id: session[:current_user_id])
      end
      flash.alert = "Article removed from favorites"
    else
      flash.alert = "Something went wrong removing from favorites"
    end
  end
end
