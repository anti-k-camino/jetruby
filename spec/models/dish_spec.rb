require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :course }
  it { should validate_presence_of :menu_id }
  it { should have_db_index [:name, :course] }
  it { should have_db_index :menu_id }

  describe Dish, ".firstmeals" do 
    let!(:menu){ create :menu }
    it "includes dishes where course == First" do 
      dish = Dish.create! name: 'soup', price: 10, course: 'First', menu: menu 
      Dish.firstmeals.should include(dish) 
    end

    it "excludes dishes where course != First" do 
      another_dish = Dish.create! name: 'spagetti', price: 10, course: 'Second', menu: menu    
      Dish.firstmeals.should_not include(another_dish)
    end 

  end

  describe Dish, ".secondmeals" do 
    let!(:menu){ create :menu }
    it "includes dishes where course == Second" do 
      dish = Dish.create! name: 'spagetti', price: 10, course: 'Second', menu: menu 
      Dish.secondmeals.should include(dish) 
    end

    it "excludes dishes where course != Second" do 
      another_dish = Dish.create! name: 'juice', price: 10, course: 'Drink', menu: menu    
      Dish.secondmeals.should_not include(another_dish)
    end 

  end

  describe Dish, ".drinks" do 
    let!(:menu){ create :menu }
    it "includes dishes where course == Drink" do 
      dish = Dish.create! name: 'juice', price: 10, course: 'Drink', menu: menu 
      Dish.drinks.should include(dish) 
    end

    it "excludes dishes where course != Drink" do 
      another_dish = Dish.create! name: 'spagetti', price: 10, course: 'Second', menu: menu    
      Dish.drinks.should_not include(another_dish)
    end 

  end
end
