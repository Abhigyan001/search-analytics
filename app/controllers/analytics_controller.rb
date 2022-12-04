class AnalyticsController < ApplicationController
  def query_list
    Analytic.group(:query, :articles, :updated_at).pluck('query, count(query) as COUNTER, articles, updated_at')
  end

  def sort_query_list
    query_list.sort_by { |element| element[1] }.reverse.first(20)
  end

  def index
    @user_search_list = sort_query_list
  end
end
