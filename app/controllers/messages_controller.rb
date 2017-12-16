class MessagesController < ApplicationController
	 before_action :authenticate_user!
	 before_action :set_message, only: [:show, :edit, :update, :destroy]
	 layout "dashboard"
	
	def show
		if params[:id].present? # If is present

			@message = Message.find(params[:id])
			@message.update_columns(:read => true, :read_at => Time.now)

		end

		# Update the notification statut to read
		#notification = Notification.update_column(:read => true)
	end

	def new
		@message = Message.new
	    
	end

	  def create
	    @message = current_user.messages.build(message_params)
	    respond_to do |format|
	      if @message.save
	        

	        #Retrieve params
	        sender_id = current_user.id
	        recipient_id = @message.recipient_id
	        #@project_url = Project.friendly.find(project.id)
	        #@project_url = project_show_path(project.id)

	        # Send notification
	        content = "vient de vous envoyez un message!"
	        Notification.create(:content => content, :sender_id => current_user.id, :receiver_id => recipient_id)

	        MessageMailer.message_email(sender_id, recipient_id, @message.id).deliver_now
	        #flash['notice'] = "Aimé avec success!"

	        #format.html { redirect_to project_show_path(project), notice: t(:bid_create_successfully) }
	        #format.json { render :show, status: :created, location: @bid }
	        format.js

	      else
	        format.html { render :new }
	        format.json { render json: @bid.errors, status: :unprocessable_entity }
	          format.js

	      end
	    end
	  end



	private
	def set_message
		@message = Message.find(params[:id])
	end

	def message_params
		params.require(:message).permit(:content, :recipient_id)
	end

end