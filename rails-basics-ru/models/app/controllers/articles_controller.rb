class ArticlesController < ApplicationController
  ARTICLES = Article.all

  def index
    @articles = ARTICLES
  end

  def show
    @article = ARTICLES.find_by id: params[:id]
  end
end
