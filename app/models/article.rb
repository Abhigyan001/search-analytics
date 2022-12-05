class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 20, maximum: 300 }

  # Display similar queries

  def self.search_article(query)
    where('title LIKE ?', "%#{query}%").pluck(:title, :id).first(10) if exists?
  end
end
