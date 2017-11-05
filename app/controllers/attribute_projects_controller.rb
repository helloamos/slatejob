class AttributeProjectsController < ApplicationController
	before_action :authenticate_user!
	def attribute
		receiver = params[:freelance]
		project = Project.find(params[:project])
		bid = Bid.find(params[:bid])
		sender = project.user_id

		attribution = AttributeProject.new(sender_id: sender, receiver_id: receiver, project_id: project.id, accepted: false)
	
			if attribution.save

				# Update project status
				project.update_attributes(status: "attributed")
				
				#Retrieve params
		        sender_id = project.user_id
		        receiver_id = bid.user_id
		        #@project_url = Project.friendly.find(project.id)
		        #@project_url = project_show_path(project.id)

		        # Send notification
		        content = "vient de vous attribuer son projet"
		        Notification.create(:content => content, :sender_id => sender, :receiver_id => receiver_id)
				
				AttributedMailer.attributed_email(project.user_id, current_user.id, project.id).deliver_now
				
				flash[:notice] = 'Le projet a été attrubé avec succès.' 
				redirect_to project_show_path(project) 
	        	
	        	
			else
				 flash[:alert] = 'Error.'
				 redirect_to project_show_path(project)
			end
		
	end
	
end