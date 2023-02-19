class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to my_page_customers_path, notice: "変更の保存しました"
    else
      render :edit
    end
  end

  def confirm_withdraw
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find_by(email: params[:email])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email, :is_deleted)
  end
end
