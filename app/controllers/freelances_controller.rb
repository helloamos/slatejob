class FreelancesController < ApplicationController
before_action :authenticate_user!

 def freelances_nearby
    #city = current_user.profile.city
    country = current_user.profile.country
    #@freelance = Project.location(country, city).order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
    @freelances =  User.joins(:profile).where.not(profiles: {id: nil}).location(country).order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)

    render layout: 'dashboard'
  end
	

end