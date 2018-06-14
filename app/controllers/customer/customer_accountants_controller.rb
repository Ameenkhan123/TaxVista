class Customer::CustomerAccountantsController < ApplicationController
   before_action :set_account, only: [:show, :edit, :update, :destroy]
  layout "customer_dashboard"

  def index 
    @customer_accountants = current_customer.customer_accountants 
  end

  def show
  end



  private
  def set_account
    @customer_accountant = CustomerAccountant.find(params[:id])
  end
  def customer_accountant_params
    params.require(:customer_accountant).permit(:accountant_id, :customer_id)
  end
end
