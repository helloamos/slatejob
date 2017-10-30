class AttributeProjectsController < ApplicationController
	def attribute
		receiver = params[:freelance]
		project = Project.find(params[:project])
		bid = Bid.find(params[:bid])
		sender = project.user_id

		attribution = AttributeProject.create(sender_id: sender, receiver_id: receiver, project_id: project, accepted: false)
		respond_to do |format|
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

				format.html { redirect_to project_show_path(project), notice: 'Le projet a été attrubé avec succès.' }
	        	format.json { render :show, status: :created, location: @category }
	        	
			else
				format.html { render :new }
	        	format.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
	end
end