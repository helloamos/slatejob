class FreelancesController < ApplicationController

	def index
		@freelances = User.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
		render layout: 'dashboard'
	end

	def resume
		@freelance = User.friendly.find(params[:slug])
		render layout: 'dashboard'
	end

end