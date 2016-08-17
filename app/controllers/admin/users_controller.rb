class Admin::UsersController < Admin::BaseController  
  before_action :set_menu, only:[:orders]
  def index
    @users = User.all
  end
  def toolbar
    @weekdays = current_user.weekdays
  end  
end
