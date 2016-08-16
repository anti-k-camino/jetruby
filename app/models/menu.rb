class Menu < ApplicationRecord
  has_many :dishes

  delegate :firstmeals, :secondmeals, :drinks, to: :dishes

  validates :day, presence: true
  validates :day, uniqueness: true

  def self.get_menu day
    Menu.where(day: day).first
  end 

  private
  def to_param
    day
  end  
end
