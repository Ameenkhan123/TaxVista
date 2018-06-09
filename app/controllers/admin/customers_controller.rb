class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  layout "admin_dashboard"
  
  def index 
    @customers = Customer.all   
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to [:admin, @customer]
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to  [:admin, @customer], notice: 'customer was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @customer] }
      else
        format.html { render :edit }
        format.json { render json: [:admin, @customer].errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to admin_customers_url, notice: 'customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation)
  end
end

