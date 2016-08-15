class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:show, :update, :dashboard]

  def show
  end

  def update
    @user.update(user_params) 
  end

  def dashboard
    @weekdays = @user.weekdays
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end