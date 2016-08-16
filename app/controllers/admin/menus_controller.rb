class Admin::MenusController < Admin::BaseController  
  def index
    @weekdays = current_user.weekdays   
  end  
end