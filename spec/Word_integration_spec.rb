require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word definer', {:type => :feature}) do
  it('makes sure capybara and sinatra are working') do
    visit('/')
    expect(page).to have_content('Welcome to the Word Definer!')
  end
end
describe('the word definer', {:type => :feature}) do
  it('checks if words are showing on the hompepage') do
    visit('/')
    fill_in('word', :with => 'test')
    click_button('Submit')
    expect(page).to have_content("test")
  end
end
