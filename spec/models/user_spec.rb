require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }  
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }  
  it { should validate_uniqueness_of(:name).case_insensitive }

  
  describe 'set_admin' do     
    before do
      @user = User.new(name: 'jetRuby', email: 'jet@ruby.com', password: '123123')      
      @user.save
    end  
    context 'first registered user' do     
      it 'user is admin' do        
        expect(@user.admin?).to be_truthy 
      end
    end
    context 'second registerd user' do
      another_user = User.new(name: 'jetRuby1', email: 'jet1@ruby.com', password: '123123') 
        it 'another_user is not admin' do
          another_user.send :set_admin
          another_user.save
          expect(another_user.admin?).to be_falsy 
      end
    end
  end
end
