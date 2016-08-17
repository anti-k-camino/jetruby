class Admin::OrdersController < Admin::BaseController  
  def show    
    @orders = Order.get_orders(params[:id])
    @price = Order.sum_price(params[:id])
  end  
end