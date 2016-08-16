class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu

  def show
  end

  def update
  end

  private

  def set_menu    
    @menu = Menu.find_by_day(params[:id])
  end
end