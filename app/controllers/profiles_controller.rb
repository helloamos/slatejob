class ProfilesController < ApplicationController
	before_action :authenticate_user!

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

		@professions = Profession.all
		# Render layout.
		render layout: "dashboard"
	end

	def show	
		@user = User.friendly.find(params[:slug])
		@experiences = @user.experiences

		#Load education section
		@educations = @user.educations
		@certifications = @user.certifications
		@awards = @user.awards
		@user_skills = @user.user_skills


		# User all experiences
		#@user_all_experiences = user.experiences
		# User all experiences
		#@user_all_publigations = user.publigations

		# User all experiences
		#@user_all_distinctions = user.awards

		# User all experiences
		#@user_all_portfolios = user.portfolios

	

		render layout: 'dashboard'
	end

	def search
	end

	def index
		@freelances = User.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
		render layout: 'dashboard'
	end

	private

	

	

end