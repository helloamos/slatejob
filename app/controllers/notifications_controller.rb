class NotificationsController < ApplicationController
	 before_action :authenticate_user!
	 layout "dashboard"
	
	def show
		if params[:id].present? # If is present

			@notification = Notification.find(params[:id])
			@notification.update_columns(:read => true, :read_at => Time.now)

		end

		# Update the notification statut to read
		#notification = Notification.update_column(:read => true)
	end

end