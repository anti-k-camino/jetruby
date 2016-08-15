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
end
