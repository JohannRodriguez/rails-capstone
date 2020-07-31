class VotesController < ApplicationController
  def create
    @article = Article.find_by_id(params[:article_id])
    if session[:current_user_id].nil?
      redirect_to new_session_path
    elsif !Vote.where(user_id: session[:current_user_id], article_id: @article.id).empty?
      redirect
    elsif @article.votes.new(user_id: session[:current_user_id]).save
      redirect
    else
      flash.alert = 'Your vote was not recorded'
    end
  end

  def destroy
    if Vote.find_by_id(params[:id]).destroy
      redirect
    end
  end

  private

  def redirect
    if params[:category_id]
      redirect_to category_path(params[:category_id])
    else
      redirect_to article_path(id: params[:article_id])
    end
  end
end
