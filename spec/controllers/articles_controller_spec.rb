require 'rails_helper'

describe 'Articles Controller', type: :feature do
  it 'should have a search-bar' do
    visit '/'
    expect(page).to have_css('.search-form')
  end

  it 'should have a body' do
    visit '/'
    expect(page).to have_content('Search Articles')
  end
end
