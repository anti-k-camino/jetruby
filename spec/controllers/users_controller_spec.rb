require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:admin_user){ create :user }
  describe UsersController do
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
  end
end
