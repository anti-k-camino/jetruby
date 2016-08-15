require 'rails_helper'

RSpec.describe Menu, type: :model do
  
  it{ should validate_presence_of :day }
  it{ should have_many :dishes }

  describe 'when delegating #firstmeals scope to dish object' do    
    it{ should respond_to(:firstmeals) }
  end

  describe 'when delegating #secondmeals scope to dish object' do    
    it{ should respond_to(:secondmeals) }
  end

  describe 'when delegating #drinks to scope dish object' do    
    it{ should respond_to(:drinks) }
  end


end
