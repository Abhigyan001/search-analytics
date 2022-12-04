class AnalyticsController < ApplicationController
  def query_list
    Analytic.group(:query, :updated_at, :articles).pluck('query, count(query) as COUNT')
  end

  def sort_query_list
    query_list.sort_by { |element| element[1] }.reverse.first(50)
  end

  def index
    @user_search_list = sort_query_list
  end
end
