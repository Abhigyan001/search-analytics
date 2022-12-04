class ArticlesController < ApplicationController
  before_action :session_present, only: [:search]

  def index
    @articles = []
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
    if params[:query].empty?
      render '/articles/index', locals: { articles: [] }
    else
      @articles = Article.search_article(params[:query])
      render '/articles/index', locals: { articles: @articles }
      query_save(params[:query], session[:user_id], @articles.length)
    end
  end

  protected

  # save new query

  def query_save(query, session, articles)
    return if query.length <= 2 || query.nil?

    new_query = Analytic.new(query: query, articles: articles)
    new_query.session_id = session
    session_last_query = Analytic.where(session_id: session).last
    if session_last_query.nil? || !session_last_query.searched_query(query)
      new_query.save
    elsif session_last_query.query.length < query.length
      session_last_query.update(query: query, articles: articles)
    end
  end

  def session_present
    session[:user_id] = SecureRandom.urlsafe_base64(16) if session[:user_id].nil?
  end
end
