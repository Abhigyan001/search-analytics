class ArticlesController < ApplicationController
  def index
    @articles = []
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
    articles = Article.where('title LIKE ?', "%#{params[:query]}%").first(10)
    render '/articles/index', locals: { articles: articles }
  end
end
