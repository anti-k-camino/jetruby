require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of :price }  
  it { should validate_presence_of :first }
  it { should validate_presence_of :second }
  it { should validate_presence_of :drink } 
  it { should validate_presence_of :day }
  it { should validate_presence_of :user }         
  
  it { should belong_to :user }
  
  describe 'count_order_price' do
    let!(:menu){create :menu, day: DateTime.now.strftime("%A")}
    let!(:first){ create :first, name: 'soup', price: 20, menu: menu}
    let!(:second){ create :second, name: 'somename', price: 15, menu: menu}
    let!(:drink){ create :drink, name: 'someother', price: 17, menu: menu}



    it 'calculates the right price' do
      order = Order.new( first:first, second:second, drink:drink )
      expect(order.count_order_price).to eq 52
    end
  end
end
