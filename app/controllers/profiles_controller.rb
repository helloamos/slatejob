class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, only: [:show, :update, :destroy]

	def edit

		# Initialize.
		

		@resource ||= current_user

		#@user_detail = UserDetail.all
		#@user_detail = current_user.user_detail
		@profile = current_user.profile
		#@user_contact = UserContact.all
		
		if @profile.nil?
			@profile = Profile.new
		else
			@profile = current_user.profile
		end

		#if @user_contact.nil?
			#@user_contact = UserContact.new
		#else
			#@user_contact = current_user.user_contact
		#end

		@professions = Profession.all
		# Render layout.
		render layout: "dashboard"
	end

	def new
		@profile = Profile.new
	end



	def create

		@profile = current_user.build_profile(profile_params)

	    respond_to do |format|
	      if @profile.save
	      	
	      	unless @profile.address.blank?
	       		split_address = @profile.address
				split_address = split_address.split(",")
				city = split_address.first
				country = split_address.last
				@profile.update_attributes(country: country, city: city)
			end
	       
	        ## Redirection
	        format.html { redirect_to edit_profile_path(current_user), notice: t(:user_detail_successfull) }
	        format.json { render :show, status: :created, location: edit_profile_path(current_user) }
	      else
	        format.html { redirect_to edit_profile_path(current_user), alert: t(:user_detail_error) }
	        format.json { render json: @profile.errors, status: :unprocessable_entity }
	      end
	    end

	end
	# PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)

       	unless @profile.address.blank?
       		split_address = @profile.address
			split_address = split_address.split(",")
			city = split_address.first
			country = split_address.last
			@profile.update_attributes(country: country, city: city)
		end

        format.html { redirect_to edit_profile_path(current_user), notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: edit_profile_path }
      else
        format.html { redirect_to edit_profile_path(current_user) }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
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
		#@users = User.joins(:user_detail)
		@freelances =  User.joins(:profile).where.not(profiles: {id: nil}).order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
		#@freelances = User.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
		render layout: 'dashboard'
	end



	private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:full_name, :company_name, :profession_id, :presentation, :availability, :visibility, :employment_type, :facebook_link, :twitter_link, :linkedin_link, :gplus_link, :address, :phone)
    end

	

end