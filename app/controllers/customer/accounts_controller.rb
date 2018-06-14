class Customer::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  layout "customer_dashboard"

  def index 
    @accounts = Account.all   
    @accounts = current_customer.accounts
  end

  def new
    @account = Account.new
  end
  
  def show
  end

  def edit
  end


  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to [:admin, @account]
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @account.update(customer_params)
        format.html { redirect_to  [:admin, @account], notice: 'account was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @account] }
      else
        format.html { render :edit }
        format.json { render json: [:admin, @account].errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to admin_customers_url, notice: 'account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_account
    @account = Account.find(params[:id])
  end
  def account_params
    params.require(:account).permit(:firm_name, :firm_type, :no_of_employees, :customer_id)
  end
end