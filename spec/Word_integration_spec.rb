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
describe('the word definer', {:type => :feature}) do
  it('checks if the "Clear list" button is clearing the word list') do
    visit('/')
    fill_in('word', :with => 'test')
    click_button('Submit')
    click_button('Clear list')
    expect(page).to have_no_content("test")
  end
end
describe('the word definer', {:type => :feature}) do
  context('when a word is clicked') do
    it('takes you to word.erb, with the definitions displayed') do
      visit('/')
      fill_in('word', :with => 'test')
      fill_in('definition', :with => 'test2')
      click_button('Submit')
      click_link('test')
      expect(page).to have_content("test2")
    end
  end
end
describe('the word definer', {:type => :feature}) do
  context('when viewing a words definitions, and the "Go back" button is clicked') do
    it('goes back to the homepage, while keeping the word-list on the homepage') do
      visit('/')
      fill_in('word', :with => 'test')
      fill_in('definition', :with => 'test2')
      click_button('Submit')
      click_link('test')
      click_button('Go back')
      expect(page).to have_content("test")
    end
  end
end
