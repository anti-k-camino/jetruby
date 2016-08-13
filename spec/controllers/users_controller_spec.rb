require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe UsersController do
    describe 'GET #index' do
      let(:users){ create_list(:user, 2) }
      it 'populates an array of users' do             

        get :index

        expect(assigns(:users)).to match_array(users)
      end

      it 'renders index view' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

end
