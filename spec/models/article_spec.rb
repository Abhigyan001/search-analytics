require 'rails_helper'

describe 'Articles', type: :model do
  title = Faker::Book.title
  text = Faker::Lorem.paragraph(sentence_count: 8)

  heading = 'foo'
  paragraph = Faker::Lorem.paragraph(sentence_count: 150)

  it 'is not valid without title' do
    article = Article.new(body: text)
    expect(article).to_not be_valid
  end

  it 'is not valid if article title is less than 5' do
    article = Article.new(title: heading, body: text)
    expect(article).to_not be_valid
  end

  it 'is not valid without article body' do
    article = Article.new(title: title)
    expect(article).to_not be_valid
  end

  it 'is not valid if body length is less than 20' do
    article = Article.new(title: title, body: heading)
    expect(article).to_not be_valid
  end

  it 'is not valid if body is more than 300' do
    article = Article.new(title: title, body: paragraph)
    expect(article).to_not be_valid
  end

  it 'is not valid if title is more than 50' do
    article = Article.new(title: paragraph, body: text)
    expect(article).to_not be_valid
  end

  it 'is valid for valid parameters' do
    article = Article.new(title: title, body: text)
    expect(article).to be_valid
  end
end
