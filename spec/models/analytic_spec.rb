require 'rails_helper'

describe 'Analytics', type: :model do
  session_id = SecureRandom.urlsafe_base64(16)
  paragraph = Faker::Lorem.paragraph(sentence_count: 100)

  it 'is not valid without session_id' do
    query = Analytic.new(query: 'foobar')
    expect(query).to_not be_valid
  end

  it 'is not valid without query' do
    query = Analytic.new(session_id: session_id)
    expect(query).to_not be_valid
  end

  it 'is valid for valid queries' do
    query = Analytic.new(query: 'foobar', session_id: session_id)
    expect(query).to be_valid
  end

  it 'is not valid if query length is more than 40' do
    query = Analytic.new(query: paragraph, session_id: session_id)
    expect(query).to_not be_valid
  end

  it 'is not valid if query length is less than 2' do
    query = Analytic.new(query: 'w', session_id: session_id)
    expect(query).to_not be_valid
  end
end
