class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @order = Order.new(order_params)
    p @order.first.price   
    @order.price = @order.count_order_price
    @order.day = DateTime.now.strftime("%A")
    @order.user = current_user    
    @order.save    
  end

  private
  
  def order_params    
    params.require(:order).permit(:first_id, :second_id, :drink_id)            
  end 
end