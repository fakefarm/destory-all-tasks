require 'spec_helper'

feature Comment do
  before(:each) do
    create(:user)
    visit login_path
    fill_in 'Email', with: 'dave@volcom.com'
    fill_in 'Password', with: 'letmein'
    click_button 'Log In'
    visit tasks_path
    fill_in 'task', with: 'Clean my room'
    click_button 'Hike'
    click_link 'Clean my room'
    fill_in 'Entry', with: "Don't forget to make the bed"
    click_button 'Save'
  end

  scenario 'adding one' do
    page.should have_text "Don't forget to make the bed"
  end

  scenario 'deleting one' do
    click_link 'destroy'
    page.should_not have_text "Don't forget to make the bed"
  end
end
