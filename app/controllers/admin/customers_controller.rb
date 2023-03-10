class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.all.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end
  
  private
    
  def customer_params
    params.require(:customer).permit(:email,:last_name,:first_name,:kana_last_name,:kana_first_name,:postal_code,:address,:phone_number,:is_deleted)
  end
  
end
