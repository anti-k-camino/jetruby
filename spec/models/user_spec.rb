require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }  
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }    
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should have_many :orders }

  
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

    context 'second registered user' do
      another_user = User.new(name: 'jetRuby1', email: 'jet1@ruby.com', password: '123123')
          it 'another_user is not admin' do          
          another_user.save
          expect(another_user.admin?).to be_falsy 
      end
    end
    
    context 'malicious user' do
      malicious_user = User.new(name: 'jetRuby2', email: 'jet2@ruby.com', password: '123123') 
        it 'malicious_user is not admin' do
          malicious_user.send :set_admin
          malicious_user.save
          expect(malicious_user.admin?).to be_falsy 
      end
    end
  end

  describe 'weekdays' do
    let!(:admin_user){ create :user }
    let!(:user){ create :user }
    
    it 'returns an array with the length of seven' do
      expect(user.weekdays.length).to eq 7
    end

    it 'returns an array with the [0] element equal to DateTime.now() day' do
      day_today = DateTime.now.strftime("%A")
      expect(user.weekdays[0]).to eq day_today
    end

    it 'returns an array with the [6] element equal to DateTime.now() - 6(tommorows menu)' do
      day_today = (DateTime.now - 6).strftime("%A")
      expect(user.weekdays[6]).to eq day_today
    end
  end
end
