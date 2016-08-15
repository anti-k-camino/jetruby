class Menu < ApplicationRecord
  has_many :dishes

  delegate :firstmeals, :secondmeals, :drinks, to: :dishes

  validates :day, presence: true
end
