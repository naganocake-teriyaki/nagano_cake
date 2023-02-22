class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end



  private

  def order_params
    params.require(:order).permit(:status)
  end

end
