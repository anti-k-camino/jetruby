class Admin::MenusController < Admin::BaseController  
  def index
    @users = User.all
  end
  
end