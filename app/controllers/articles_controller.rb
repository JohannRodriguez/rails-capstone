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
    @article = @user.articles.build(article_params)
    if @article.valid?
      @article.save
      flash.alert = 'Article succesfully created'
      redirect_to article_path(@user.articles.order(:created_at).reverse_order.first)
    else
      flash[:notice] = @article.errors.full_messages[0]
      render :new
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
      flash[:notice] = @article.errors.full_messages[0]
      render :edit
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.saved_articles.delete_all
    Vote.where(article_id: @article.id).destroy_all
    @article.destroy
    flash.alert = 'Article deleted'
    redirect_to user_path(session[:current_user_id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
