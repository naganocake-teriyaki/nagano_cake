class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    if @order_detail.update(order_detail_params)
      if order_detail_params[:production_status] == "in_production"
        @order_detail.order.update(status:2)
      elsif @order_details.count == @order_details.where(production_status: "production_completed").count
        @order_item.order.update(status:3)
      end
      redirect_to admin_order_path(@order_detail.order_id)
    end
  end


  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
