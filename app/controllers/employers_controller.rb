class EmployersController < ApplicationController
	before_action :authenticate_user!

	layout 'dashboard'

	def index
		@employers = User.joins(:profile).where.not(profiles: {id: nil}).by_profile("Employer").order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
	end

	def show	
		@user = User.friendly.find(params[:slug])
		@experiences = @user.experiences

		#Load education section
		@educations = @user.educations
		@certifications = @user.certifications
		@awards = @user.awards
		@user_skills = @user.user_skills


		# Update view number
    	view_number = @user.view_number.to_i + 1 unless @user.blank?
    
    	@user.update_attributes(:view_number => view_number)


		# User all experiences
		#@user_all_experiences = user.experiences
		# User all experiences
		#@user_all_publigations = user.publigations

		# User all experiences
		#@user_all_distinctions = user.awards

		# User all experiences
		#@user_all_portfolios = user.portfolios

	end

end