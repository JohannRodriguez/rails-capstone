class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("priority")
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    if @category.relate_categories.where(article_id: params[:article_id]).empty?
      flash.alert = 'Category succesfully added to your article'
      redirect_to article_path(id: params[:article_id]) if @category.relate_categories.new(article_id: params[:article_id]).save
    else
      flash.alert = 'Category already exist for this article'
      redirect_to article_path(id: params[:article_id])
    end
  end

  def show
    @category = Category.find_by_id(params[:id])
    @user = User.find_by_id(session[:current_user_id])
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    if @category.relate_categories.where(article_id: params[:article_id]).destroy_all
      flash.alert = 'Category succesfully removed from your article'
      redirect_to article_path(id: params[:article_id])
    end
  end
end
