class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("priority")
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    if @category.relatecategories.where(article_id: params[:article_id]).empty?
      redirect_to article_path(id: params[:article_id]) if @category.relatecategories.new(article_id: params[:article_id]).save
    else
      flash.alert = 'Category alreday exist for this article'
      redirect_to article_path(id: params[:article_id])
    end
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    if @category.relatecategories.where(article_id: params[:article_id]).destroy_all
      redirect_to article_path(id: params[:article_id])
    end
  end
end
