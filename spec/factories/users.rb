FactoryGirl.define do
  sequence :name do |n|
    "MyString#{n}"
  end
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    name 
    email
    password '123456'    
  end
end
