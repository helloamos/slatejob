class EmployersController < ApplicationController
	before_action :authenticate_user!

	layout 'dashboard'

	def index
		@employers = User.joins(:profile).where.not(profiles: {id: nil}).by_profile("Employer").order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
	end
end