require 'rails_helper'

feature 'User sign up', %q{
  As a guest
  I should be able to sign up
  with name, email and password.
} do  
    context 'valid attribets' do 

      scenario 'Non-registered user try sign up' do    
        visit root_path
        within('.nav') do
          click_on 'Register'
        end
        expect(current_path).to eq new_user_registration_path

        fill_in 'Name', with: 'jetruby'
        fill_in 'Email', with: 'jet@ruby.com'
        fill_in 'Password', with: 123456
        fill_in 'Password confirmation', with: 123456

        click_on 'Sign up'       

       within('.nav') do
          expect(page).to_not have_content 'Register'
          expect(page).to have_content 'Sign out'
        end
      end 
         
    end
    context 'invalid attributes' do
      user = User.new(name: 'test', email: 'test@email.com', password: '123123')

      scenario 'No name has been provided' do
        visit new_user_registration_path

        fill_in 'Email', with: 'jet@ruby.com'
        fill_in 'Password', with: 123456
        fill_in 'Password confirmation', with: 123456

        click_on 'Sign up'        

        expect(page).to have_content "Name can't be blank"
        expect(current_path).to eq user_registration_path        
      end

      scenario 'Duplicate username(non case sensible)' do
        sign_up(user)        
        within('.nav') do
          click_on 'Sign out'
        end

        within('.nav') do
          click_on 'Register'
        end
        expect(current_path).to eq new_user_registration_path

        fill_in 'Name', with: 'Test'
        fill_in 'Email', with: 'jet@ruby.com'
        fill_in 'Password', with: 123456
        fill_in 'Password confirmation', with: 123456

        click_on 'Sign up'

        expect(page).to have_content 'Name has already been taken'
        expect(current_path).to eq user_registration_path
      end

    end

end