require_relative 'acceptance_helper'

feature 'User view dashboard', %q{
  In order to make an order
  as a registered user
  I want to see a weekdays on the dashboard page 
} do
  
  context 'Registerd user' do 
    let!(:admin_user){ create :user }
    let(:user){ create :user }
    scenario 'can see weekdays correctly orderd' do      
      sign_in user
      click_on 'Dashboard'

      expect(current_path).to eq dashboard_user_path(user)
      expect(page).to have_content DateTime.now.strftime("%A")
      
      within('.archive_1') do
        expect(page).to have_content (DateTime.now - 1).strftime("%A")
      end
      within('.archive_6') do
        expect(page).to have_content (DateTime.now - 6).strftime("%A")
      end
    end
  end

  context 'Non-registered user' do
    scenario 'can not see Dashboard and get archieved orders || set an order' do
      visit root_path
      expect(page).to_not have_link 'Dashboard' 
    end                                                                                                            
  end

end