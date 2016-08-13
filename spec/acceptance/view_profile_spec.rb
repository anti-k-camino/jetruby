require 'rails_helper'

feature 'User view profile', %q{
  In order to clearify info about myself
  As a registered user
  I want to be able to view my profile.
} do
  context 'Registerd user' do 
    let!(:admin_user){ create :user }
    let(:user){ create :user }     
    scenario 'user can view profile' do    
      sign_in(user) 
      within('.nav') do
        click_on 'Profile'
      end
      expect(page).to have_content user.name
      expect(page).to have_content user.email
      expect(current_path).to eq user_path(user)     
    end
  end 
  context 'Non-registerd user' do
    scenario 'can not see profile' do
      visit root_path
      expect(page).to_not have_link 'Profile'
    end
  end 
end