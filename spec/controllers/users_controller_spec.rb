require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:admin_user){ create :user }
    describe 'GET #show' do      
      context 'Non-registered user' do
      end
      context 'Registered user' do
        sign_in_user
        before { get :show, id: @user }

        it 'assigns requested user to @user' do      
          expect(assigns :user).to eq @user
        end        
        
        it 'renders view show' do      
          expect(response).to render_template :show
        end

      end
    end
    describe 'GET #dashboard' do

      context 'Non-registered user' do                                                
        it 'does not show dashboard' do
          get :dashboard, id: 10 
          expect(response).to_not render_template :dashboard
        end
      end

      context 'Registered user' do
        sign_in_user
        before { get :dashboard, id: @user.id }

        it 'assigns requested user to @user' do      
          expect(assigns :user).to eq @user
        end 

        it 'does not show dashboard' do
          expect(response).to render_template :dashboard
        end
      end
    end

    describe 'PATCH #update' do
      
      context 'Non-authenticated user try to edit user' do       
        let!(:user){ create :user }
        it 'fails to update user' do
          us = (assigns :user)
          patch :update, id: user, user:{ name: 'Malicious try'}, format: :js
          user.reload        
          expect(assigns :user).to eq us
        end      
      end 

      context 'Authenticated user' do
        sign_in_user

        it 'assignes user to @user' do
          patch :update, id: @user, user:{ name: 'Someuser'}, format: :js
          expect(assigns :user).to eq @user
        end

        it 'does not create some new user' do
          expect{ patch :update, id: @user, user: { name: 'Someuser' }, format: :js }.to_not change(User, :count)
        end

        it 'changes user attributes' do
          patch :update, id: @user, user: { name: 'Someuser' }, format: :js
          @user.reload
          expect(assigns :user).to eq @user
        end

      end
    end    
 
end
