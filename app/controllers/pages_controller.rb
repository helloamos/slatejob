class PagesController < ApplicationController

	before_action :authenticate_user!, only: [:account]
	before_action :resource_name, only: [:account]

	def account

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

	def landing_page
	end

	def subscription

		 @subscription = Subscription.new
	end

	def privacy_policy
		render :layout => "application"
	end

	def cgu
		render :layout => "application"
	end

	def blog
		render :layout => "application"
	end

	def faq
		render :layout => "application"
	end

	def services
		render :layout => "application"
	end

	def partenaires
		render :layout => "application"
	end

	def advertise
		render :layout => "application"
	end

	def contact
		render :layout => "application"
	end

	private

	def set_account
		@user_detail = current_user.detail
		@user_contact = current_user.contact

	end
	def resource_name
	    :user
	end
	

end