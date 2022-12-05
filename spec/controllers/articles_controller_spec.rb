require 'rails_helper'

describe 'Articles Controller', type: :feature do
  it 'should have a search-bar' do
    visit '/'
    expect(page).to have_css('#search-form')
  end

  it 'should have a body' do
    visit '/'
    expect(page).to have_css('.heading-img')
  end

  it 'should redirect to search analytics page' do
    visit '/'
    find('a', text: 'See Search Analytics').click
    expect(page).to have_content('Search Frequency')
  end
end
