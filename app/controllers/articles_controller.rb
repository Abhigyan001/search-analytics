class ArticlesController < ApplicationController
  def index
    @articles = []
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
  end
end
