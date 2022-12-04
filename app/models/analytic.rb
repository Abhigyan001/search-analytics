class Analytic < ApplicationRecord
  require 'fuzzystringmatch'
  validates :query, presence: true, length: { minimum: 2, maximum: 40 }
  validates :session_id, presence: true

  def searched_query(search)
    fuzzy_match = FuzzyStringMatch::JaroWinkler.create(:native)
    query_match = fuzzy_match.getDistance(search, query)
    query_match > 0.8
  end
end
