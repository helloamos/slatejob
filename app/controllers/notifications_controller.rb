class NotificationsController < ApplicationController
	 before_filter :authenticate_user!
	
	def show
		if params[:ref].present? # If is present

			@notification = Notification.find(params[:ref])
			@notification.update_columns(:read => true, :read_at => Time.now)

		end

		# Update the notification statut to read
		#notification = Notification.update_column(:read => true)
	end

end