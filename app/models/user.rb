class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_create :set_admin

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable   

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  private
  def set_admin
    self.admin = User.count == 0
  end   
end
