class Admin::AccountantsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_accountant, only: [:show, :edit, :update, :destroy]
  layout "admin_dashboard"
  
  def index 
    @accountants = Accountant.all   
  end

  def new
    @accountant = Accountant.new
  end

  def edit
  end

  
  def create
    @accountant = Accountant.new(accountant_params)
    if @accountant.save
      redirect_to [:admin, @accountant]
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @accountant.update(accountant_params)
        format.html { redirect_to  [:admin, @accountant], notice: 'accountant was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @accountant] }
      else
        format.html { render :edit }
        format.json { render json: [:admin, @accountant].errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @accountant.destroy
    respond_to do |format|
      format.html { redirect_to admin_accountants_url, notice: 'accountant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_accountant
    @accountant = Accountant.find(params[:id])
  end
  def accountant_params
    params.require(:accountant).permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation)
  end
end

