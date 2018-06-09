class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  layout "admin_dashboard"
  
  def index 
    @admins = Admin.all   
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to [:admin, @admin]
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to  [:admin, @admin], notice: 'admin was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @admin] }
      else
        format.html { render :edit }
        format.json { render json: [:admin, @admin].errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_url, notice: 'admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

