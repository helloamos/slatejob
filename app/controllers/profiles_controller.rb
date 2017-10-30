class ProfilesController < ApplicationController
	
	def edit

		# Initialize.
		

		@resource ||= current_user

		#@user_detail = UserDetail.all
		@user_detail = current_user.user_detail
		@user_contact = current_user.user_contact
		#@user_contact = UserContact.all
		
		if @user_detail.nil?
			@user_detail = UserDetail.new
		else
			@user_detail = current_user.user_detail
		end

		if @user_contact.nil?
			@user_contact = UserContact.new
		else
			@user_contact = current_user.user_contact
		end

	
		# Render layout.
		render layout: "dashboard"
	end

	def show
		@freelance = User.friendly.find(params[:slug])
		render layout: 'dashboard'
	end

	def search
	end

	def index
		@freelances = User.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
		render layout: 'dashboard'
	end

	

end