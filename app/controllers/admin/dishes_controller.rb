class Admin::DishesController < Admin::BaseController
  def new
    @dish = Dish.new
  end
  def create
    @dish = Dish.new(dish_params)
    @menu = Menu.where(day: DateTime.now.strftime("%A")).first    
    @dish.menu = @menu
    if @dish.save
      redirect_to toolbar_admin_user_path(current_user)
    else
      render :new
    end
  end

  private  
  def dish_params
    params.require(:dish).permit(:course, :name, :price)
  end
end
