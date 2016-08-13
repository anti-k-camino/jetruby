require 'rails_helper'

feature 'User sign in', %q{
  In order to make orders
  As a registered user
  I should be able to sign in with email and password.
} do 
  let(:user){ create(:user) }

  scenario "Registered user try's to sign" do   
    visit root_path
    expect(page).to have_content "Sign in"
    sign_in user

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
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