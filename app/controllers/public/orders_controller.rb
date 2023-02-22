class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
  
  def show
    @total = 0
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def index
    @total = 0
    @orders = current_customer.orders
  end
  
  def success
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.postage=800
    @order.customer_id = current_customer.id
    
    if params[:order_address] == "option1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order_address] == "option2"
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.name = @address.name
      @order.postal_code = @address.postal_code
    elsif params[:order_address] == "option3"
    end
    @total = 0
    @cart_items=current_customer.cart_items
    @payment = 0
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price =cart_item.item.price*1.1
      @order_detail.amount = cart_item.amount
      @order_detail.save!
    end

    current_customer.cart_items.destroy_all

    redirect_to thanks_orders_path
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :payment, :postage, :postal_code, :address, :name)
  end

end
