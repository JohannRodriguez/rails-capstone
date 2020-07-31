class SaveArticlesController < ApplicationController
  def index
    @user = User.find_by_id(session[:current_user_id])
    @article = Article.all
  end

  def create
    @user = User.find_by_id(session[:current_user_id])
    if !@user.saved_articles.where(article_id: params[:article_id]).empty?
      flash.alert = 'This article is already saved'
    elsif @user.saved_articles.new(article_id: params[:article_id]).save
      flash.alert = 'Article succesfully saved'
    else
      flash.alert = "Article wasn't saved"
    end
    redirect_to article_path(params[:article_id])
  end

  def destroy
    @saved_article = SaveArticle.find_by_id(params[:id])
    if @saved_article.destroy
      flash.alert = "Your saved article was deleted"
    else
      flash.alert = "You still have the article D:"
    end
    redirect_to saved_articles_index_path(id: session[:current_user_id])
  end
end
