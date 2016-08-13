require 'rails_helper'

feature 'User sign in', %q{
  In order to make orders
  As a registered user
  I should be able to sign in with email and password.
} do 
  let!(:admin_user){ create :user }
  context 'Rergistered non-admin  user' do    
    let(:user){ create(:user) }

    scenario "try's to sign in " do   
      visit root_path
      expect(page).to have_content "Sign in"
      sign_in user

      expect(page).to have_content 'Signed in successfully.'
      expect(current_path).to eq root_path
    end 
  end
  context 'Registered admin user' do  

    scenario "try's to sign in " do   
      visit root_path
      expect(page).to have_content "Sign in"
      sign_in admin_user

      expect(page).to have_content 'Signed in successfully.'
      expect(current_path).to eq toolbar_admin_user_path(admin_user)
    end 
  end

  scenario "Non registered user try's to sign in" do
    visit new_user_session_path

    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password'
    expect(current_path).to eq new_user_session_path
  end

end