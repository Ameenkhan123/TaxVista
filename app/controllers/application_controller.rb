class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
      if admin_signed_in?
        admin_dashboard_path
      else
        root_path
      end
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation) }
    end
end
