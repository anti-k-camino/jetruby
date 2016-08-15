class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_create :set_admin

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable   

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def weekdays
    deduct_weekdays.map{|day| day.strftime("%A")}
  end

  private
  def deduct_weekdays
    arr = []
    @n = 0
    7.times do 
      arr << DateTime.now - @n      
      @n += 1
    end
    arr
  end
  def set_admin
    self.admin = User.count == 0
  end   
end
