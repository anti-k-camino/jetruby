require_relative '../acceptance_helper'

feature 'Admin sees users list', %q{
  In order to keep track of users / orders 
  As an administrator
  I want to be able to browse all registered users.
} do
  context 'Rgistered user' do
    let!(:admin_user){ create :user }
    let!(:users_list){ create_list(:user, 2) }

    scenario 'admin can see list of users' do
      sign_in admin_user      
      click_on 'Browse users'
      expect(current_path).to eq admin_users_path
      expect(page).to have_content admin_user.name 
      expect(page).to have_content users_list[0].name 
      expect(page).to have_content users_list[1].name       
    end

    scenario 'non-admin user can not see list of users' do
      sign_in users_list[0]
      expect(page).to_not have_link 'Browse users'
    end

  end
end