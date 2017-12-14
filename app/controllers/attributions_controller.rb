class AttributionsController < ApplicationController
	before_action :authenticate_user!

	def new
		recipient = params[:freelance]
		project = Project.find(params[:project])
		bid = Bid.find(params[:bid])
		sender = project.user_id

		attribution = Attribution.new(bid_id: bid.id, sender_id: sender, recipient_id: recipient, project_id: project.id, accepted: false)
		respond_to do |format|
			if attribution.save

				# Update project status
				project.update_attributes(status: "attributed")
				
				#Retrieve params
		        sender_id = project.user_id
		        recipient = bid.user_id
		        #@project_url = Project.friendly.find(project.id)
		        #@project_url = project_show_path(project.id)

		        # Send notification
		        content = "vient de vous attribuer son projet"
		        Notification.create(:content => content, :sender_id => sender, :receiver_id => recipient)
				
				AttributedMailer.attributed_email(project.user_id, current_user.id, project.id).deliver_now
				
				flash[:notice] = 'Le projet a été attrubé avec succès.' 
				
	        	
	        	format.html { redirect_to project_show_path(project), notice: t(:bid_create_successfully) }
        		format.json { render :show, status: :created, location: @bid }
        		
			else
				 flash[:alert] = 'Error.'
				 redirect_to project_show_path(project)
			end
		end
		
	end
	
end