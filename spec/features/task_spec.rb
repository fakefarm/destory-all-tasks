require 'spec_helper'

feature Task do
  before(:each) do
    create(:user)
    visit login_path
    fill_in 'Email', with: 'dave@volcom.com'
    fill_in 'Password', with: 'letmein'
    click_button 'Log In'

    visit tasks_path
    fill_in 'task', with: 'Clean my room'
    click_button 'Hike'
  end

  describe 'task page' do
    describe 'task page' do
      scenario 'add one' do
        page.should have_text 'Clean my room'
      end

      scenario 'destroy one' do
        click_link 'Destroy'
        page.should_not have_text 'Clean my room'
      end

      scenario 'punt one' do
        click_button 'punt'
        page.should_not have_text 'Clean my room'
      end
    end
  end

  describe 'punt page' do
    before(:each) do
      click_button 'punt'
      visit punted_tasks_path
    end

    scenario 'viewing punts' do
      page.should have_text 'Clean my room'
    end

    scenario 'returning punts' do
      click_button 'return'
      # TODO - how to say...
      # page.should have no_tasks
    end
  end
end

