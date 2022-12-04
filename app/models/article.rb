class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7, maximum: 60 }
  validates :body, presence: true, length: { minimum: 18, maximum: 300 }

  def self.search_article(query)
    where('title LIKE ?', "%#{query}%").pluck(:title, :id).first(10) if exists?
  end
end
