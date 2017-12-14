class WorkersController < ApplicationController
	before_action :authenticate_user!

	layout 'dashboard'

	def index
		@workers = User.joins(:profile).where.not(profiles: {id: nil}).by_profile("Worker").order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
		#@workers = @workers.by_profile("Work").order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
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

 	def workers_nearby
	    #city = current_user.profile.city
	    country = current_user.profile.country
	    #@freelance = Project.location(country, city).order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
	    @freelances =  User.joins(:profile).where.not(profiles: {id: nil}).location(country).order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)

	   
  end
	

end