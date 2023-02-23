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

    if params[:order][:order_address] == "option1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:order_address] == "option2"
      if @address = Address.find(params[:order][:address_id])
        @order.address = @address.address
        @order.name = @address.name
        @order.postal_code = @address.postal_code
      else
      render :new
      end
    elsif params[:order][:order_address] == "option3"
      #@orderの中にOrder.newで空の住所情報を上で記述してるため中に入れる必要がある。
      #elsif内のみで@orderの中に各情報を入れるために@addressを作成。以下は必要項目を入れるための式
      @address = current_customer.addresses.new
      @address.address=params[:order][:address]
      @address.name =params[:order][:name]
      @address.postal_code =params[:order][:postal_code]
      @address.save
      @order.postal_code =@address.postal_code
      @order.name =@address.name
      @order.address =@address.address
    end
    @total = 0
    @cart_items=current_customer.cart_items
    @payment = 0
  end

  def create
    @order = Order.new(order_params)

    if @order.save

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
    else
      render :new
    end


  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment, :postage, :postal_code, :address, :name, :payment_method, )
  end

end
