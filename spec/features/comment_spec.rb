require 'spec_helper'

feature Comment do
  before(:each) do
    visit tasks_path
    fill_in 'Task', with: 'Clean my room'
    click_button 'Save'
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