class ArticlesController < ApplicationController
  def index
    @article = Article.all
    @categories = Category.all
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find_by_id(session[:current_user_id])
    if @user.articles.build(article_params).save
      flash.alert = 'Article succesfully created'
      redirect_to article_path(@user.articles.order(:created_at).reverse_order.first)
    else
      flash.alert = 'Invalid field(s)'
      redirect_to new_article_path
    end
  end

  def show
    @article = Article.find_by_id(params[:id])
    @user = User.find_by_id(@article.author_id)
    @category = Category.all
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    if @article.update(article_params)
      flash.alert = 'Article succesfully updated'
      redirect_to article_path(id: params[:id])
    else
      flash.alert = 'Somehting went wrong trying to edit your article'
      render :edit
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.relate_categories.destroy_all
    @article.saved_articles.delete_all
    Vote.where(article_id: @article.id).destroy_all
    @article.destroy
    redirect_to user_path(session[:current_user_id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
