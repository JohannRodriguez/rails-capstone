class HomeController < ApplicationController
  def index
    @article = Article.all
    @categories = Category.all
  end
end
