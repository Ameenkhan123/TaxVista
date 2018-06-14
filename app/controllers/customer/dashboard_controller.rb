class Customer::DashboardController < ApplicationController
  before_action :authenticate_customer!
  layout "customer_dashboard"
  def index    
  end
  
end
