class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_admin 

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false } 



  private
  def set_admin
    self.admin = User.count == 0
  end   
end
