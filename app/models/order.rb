class Order < ApplicationRecord
  belongs_to :user
  belongs_to :first
  belongs_to :second
  belongs_to :drink

  validates :user, :first, :second, :drink, :day, :price, presence: true

  def self.get_orders(day)
    where(day: day)
  end

  def self.sum_price(day)
    where(day: day).sum(:price)
  end

  def count_order_price
    self.first.price + self.second.price + self.drink.price
  end  
end
