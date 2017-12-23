require 'spec_helper'
require 'rails_helper'

feature 'shows index page' do 
  scenario 'has an index page' do 
    visit goals_url 
    expect(page).to have_content('All the Goals')
  end

    
  before(:each) do 
    u = User.create(username: 'joe', password: '123456')
    g = Goal.create(title: 'sleep', user_id: u.id, finished?: false)
    visit(new_session_url)
    fill_in('Username', with: 'joe')
    fill_in('Password', with: '123456')
    click_on('Log In')  
  end 
  
  scenario 'if logged in, shows current user' do
    expect(page).to have_content('joe')
  end 
  
  scenario 'shows all goals' do 
    u.goals.each do |goal| 
      expect(page).to have_content(goal.title)
    end 
  end 
    
end 
