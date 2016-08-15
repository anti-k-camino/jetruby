class Dish < ApplicationRecord
  
  belongs_to :menu  
  
  self.inheritance_column = :course

  scope :firstmeals, -> { where(course: 'First') } 
  scope :secondmeals, -> { where(course: 'Second') } 
  scope :drinks, -> { where(course: 'Drink') }

  validates :name, :price, :course, :menu_id, presence: true

  def self.courses
    %w(First Second Drink)
  end
end
