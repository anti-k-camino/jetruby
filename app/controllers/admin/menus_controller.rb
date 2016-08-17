class Admin::MenusController < Admin::BaseController
  before_action :set_menu , only:[:update]
  def show  
    @menu = Menu.where(day: params[:id])  
  end
end