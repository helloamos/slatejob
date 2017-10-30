class DashboardController < ApplicationController
	before_action :authenticate_user!
	def index

		@projects = Project.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
        @categories = Category.all
	end
end