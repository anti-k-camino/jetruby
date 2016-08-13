require_relative 'acceptance_helper'

feature 'User edit profile', %q{
  In order to clearify info about myself
  As a registered user
  I want to be able to edit my profile.
} do

  context 'Registered user edit profile' do
    let!(:admin_user){ create :user } 
    let!(:user){ create :user }    
    scenario 'with valid attributes', js: true do
      sign_in user      
      click_on 'Profile'
      expect(current_path).to eq user_path(user)    
      click_on 'Edit'      
      expect(page).to have_link "Change your password", href: edit_user_registration_path
      fill_in 'Name', with: 'SomeFancyUser'
      click_on 'Update'       
      wait_for_ajax
      expect(current_path).to eq user_path(user)
      within('.edit_toggle') do
        expect(page).to have_content 'SomeFancyUser'
      end                  
    end

    scenario 'with ivalid attributes', js: true do
      sign_in user      
      click_on 'Profile' 
      expect(current_path).to eq user_path(user) 
      click_on 'Edit'      
      expect(page).to have_link "Change your password", href = edit_user_registration_path
      fill_in 'Name', with: ''
      click_on 'Update'
      wait_for_ajax
      expect(current_path).to eq user_path(user)
      expect(page).to have_content "Name can't be blank"
                  
    end
  end
  
end