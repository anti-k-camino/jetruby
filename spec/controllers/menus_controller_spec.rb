require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  let!(:admin_user){ create :user }
    describe 'GET #show' do 
      let!(:menu){ create :menu }     
      context 'Non-registered user' do

        it ' does not render view show' do         
          xhr :get, :show, id: menu.day    
          expect(response).to_not render_template :show
        end
        
      end

      context 'Registered user' do        
        sign_in_user

        before { xhr :get, :show, id: menu.day }        

        it 'assigns requested menu to @menu' do            
          expect(assigns :menu).to eq menu
        end        
        
        it 'renders view show' do            
          expect(response).to render_template :show
        end
      end
    end
    
end
