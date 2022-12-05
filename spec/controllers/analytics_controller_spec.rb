require 'rails_helper'

describe 'Analytics Controller', type: :feature do
  session_id = SecureRandom.urlsafe_base64(12)

  before(:all) do
    30.times do |e|
      Analytic.create(
        query: "query#{e}",
        session_id: session_id
      )
    end
  end

  it 'should display analytics page' do
    visit '/analytics'
    expect(page).to have_content('Search Frequency')
  end

  it 'should only show top 15 queries' do
    visit '/analytics'
    expect(page).to have_content('query9')
  end

  it 'should not show queries that are not in top 15' do
    Analytic.create(
      query: 'above fifteen',
      session_id: session_id
    )
    visit '/analytics'
    expect(page).to_not have_content('above fifteen')
  end
end
