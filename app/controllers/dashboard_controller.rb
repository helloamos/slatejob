class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :complete_profile
	def index

		@projects = Project.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
        #@categories = Category.all
	end

	private
	def complete_profile
		if current_user.profile.blank?
			redirect_to edit_profile_path(current_user)
		end
	end
end