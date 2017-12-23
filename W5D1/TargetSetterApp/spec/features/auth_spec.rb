require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do    
    visit new_user_url
    expect(page).to have_content('New User')
    
    feature 'signs up a user' do
      before(:each) do
        visit(new_user_url)
        fill_in('Username', with: 'userguy')
        fill_in('Password', with: 'passwordguy')
        click_on('Create User')
      end
      
      scenario 'redirect to goals index page after signup' do
        expect(page).to have_content('Goal Index Page')
      end
      
      scenario 'shows username on the homepage after signup' do
        expect(page).to have_content('userguy')
      end
    end
  end
end

feature 'logging in' do
  before(:each) do 
    visit(goals_url)
  end
  
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content('userguy')
  end

end

feature 'logging out' do
  before(:each) do
    visit(new_session_url)
  end
  
  scenario 'begins with a logged out state' do
    expect(page).to have_content("Log In")
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).not_to have_content('userguy')
  end

end