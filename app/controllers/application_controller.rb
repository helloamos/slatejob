class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_type, :login, :company_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:profile_type, :user_name, :login, :company_name,:avatar])
	end

	def after_sign_in_path_for(resource)
		dashboard_path
	
	end

	def after_sign_up_path_for(resource)
		#after_registration_path(:personal)
		#wizard_path(:personal_info)
		#redirect_to dashboard_path
		edit_user_registration_path
	end


end
