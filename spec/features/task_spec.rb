require 'spec_helper'

feature Task do
  before(:each) do
    visit root_path
    fill_in 'Task', with: 'Clean my room'
    click_button 'Save'
  end

  describe 'basic features' do
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

  describe 'punt page' do
    before(:each) do
      click_button 'punt'
      visit punted_tasks_path
    end

    scenario 'viewing punts' do
      page.should have_text 'Clean my room'
    end

    scenario 'returning punts' do
      click_button 'return now'
      page.should have_text 'Clean my room'
    end
  end
end