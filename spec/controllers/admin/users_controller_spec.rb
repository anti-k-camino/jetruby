require 'admin/users_controller'
require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe Admin::UsersController do
    describe 'GET #index' do
      sign_in_user
      let(:example_user){ create :user }

      before do
        get :index
      end

      it 'populates an array of users' do 
        expect(assigns(:users)).to match_array([@user, example_user])
      end

      it 'renders index view' do        
        expect(response).to render_template :index
      end

    end
  end

end
