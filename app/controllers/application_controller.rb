class ApplicationController < ActionController::Base
	helper ComponentsHelper
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	#add_flash_types :success, :danger, :info
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_type, :login, :company_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:profile_type, :user_name, :login, :company_name,:avatar])
	end

	def after_sign_in_path_for(resource)
		dashboard_path
	
	end

	

	


end
