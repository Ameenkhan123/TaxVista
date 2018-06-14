class HomeController < ApplicationController
  
  def contact;end

  def refer;end 

  def customer_dashboard 
  end

  def account_dashboard
   @accounts = Account.all   
   @customers = Customer.all
  end
end
