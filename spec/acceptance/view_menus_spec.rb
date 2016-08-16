require_relative 'acceptance_helper'

feature 'User view dashboard', %q{
  As a user, when I click on the weekday
  (today or days in the past),
  I can see menu ­ list 
  of items with prices. 
} do

  context 'Registerd user' do 
    let!(:admin_user){ create :user }
    let!(:user){ create :user }
    let!(:menu){ create :menu, day: DateTime.now.strftime("%A") }
    let!(:old_menu){ create :menu, day: (DateTime.now - 1).strftime("%A") }
    let!(:dish){ create :dish, course: 'First', menu: menu }
    let!(:another_dish){ create :dish, course: 'Second', menu: old_menu }
     

    scenario 'can see menu for today and arichived ones', js: true do
      sign_in user
      visit dashboard_user_path(user)           
      expect(current_path).to eq dashboard_user_path(user)
      save_and_open_page
      click_on "Today's menu"        
      wait_for_ajax      
      expect(page).to have_content dish.name
      click_on "#{old_menu.day}'s menu"
      wait_for_ajax
      within('.archive_view') do
        expect(page).to have_content another_dish.name
      end
    end
  end

end