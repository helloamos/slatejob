
module ApplicationHelper
	def resource_name
	    :user
	end

	def resource
	    @resource ||= User.new
	end

	def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	end
	
	def project_user(id)
		user = User.find(id)
		user.login
	end

	def user(user_id)
		user = User.find(user_id)
		#user.avatar.url
	end

	def cu_action_label(obj)
		if obj.object.new_record?
			return t(:new_record)
		else
			return t(:update_record)
		end
	end

	def do_separator(item, content)

		if item != content.last 
			html = "<hr />"
			return html.html_safe
		end
	end

	#def currency_symbol(id)
		#currency = Currency.find(id)
		#currency.currency_symbol unless currency.blank?
	#end
	def time_unity(id)
		unity = TimeUnity.find(id)
		unity.title
	end
	def user_fame(user_id)
		user_detail = UserDetail.find(user_id: user_id)
	end

	def project_total_bids(project_id)
		project = Project.find(project_id)
		total_bids = project.bids.count
	end

	def can_post_bid?(user_id, project_id)

		bids = Bid.can_post_bid(user_id, project_id)

		project = Project.find(project_id)

		# Show post bid button
		if  user_id == project.user_id
			return false
		elsif bids.count > 0
			return false
		else
			# Hide post bid button
			return true
		end

	end

	def skill_title(skill_id)
		skill = Skill.find(skill_id)
		skill = skill.title unless skill.title.nil?
	end

	def project_skills(project_id)
		project = Project.find(project_id)
		@project_skills = project.project_skills
	end

	# Count current user unread notification
	def unread_notification
	  @notifications = Notification.unread_notification(current_user.id).order(:created_at => "DESC")
	  notification = Notification.unread_notification(current_user.id).count

	  if notification.nil? 
	  	notification  = 0
	  else
	  	notification 
	  end
	end



	#User unread message
	def unread_message
	  @messages = Message.unread_message(current_user.id).order(:created_at => "DESC")
	  message_count = Message.unread_message(current_user.id).count
	  if message_count.nil?
	  	message_count = 0
	  else
	  	message_count
	  end
	end

	

	def profession_title(profession_id)
		if profession_id.present?
			profession = Profession.find(profession_id)
			profession.title
		end
	end

	

	
	
	def is_available?(user_id)
		user = User.find(user_id)
		availability = user.profile.availability

		if availability
			return true
		else
			return false
		end
	end


	# Check if the project is attributed?
	def attributed?(project_id)
		#attributed = AttributeProject.find_by_project_and_user(project.id, user.id)
		project = Attribution.attributed(project_id)

		if project.blank?

			return false
			
		else
			return true

		end

	end

	# Check if the current project is th mine.
	def my_project?(project_id, user_id)
		#user = User.find(user_id)
		project = Project.my_project(project_id, user_id)

		if project.blank?
			return false
		else
			return true
		end
	end


	def bid_project_title(bid_id)
		bid = Bid.find(bid_id)
		project = Project.find(bid.project_id)
		project.title unless project.nil?
	end

	def project_instead(project_id)
		
		project = Project.find(project_id)
		
	end
	def user_instead(user_id)
		
		user = User.find(user_id)
		
	end

	def is_current_user?(user_id)
		if user_id == current_user
			return true
		else
			return false
		end
	end


	

	def uncomplete_profile?
		#user = User.find(current_user.id)
		profile = current_user.profile
		#user_detail = user.user_detail
		#user_contact = user.user_contact
		if profile.nil? 
			return true
		elsif  profile.profession_id.nil? || profile.presentation.blank? || profile.address.blank?
			return true
		else
			return false
		
		end

	end

	# social auto share
	def twitter_share(post_title, post_desc)
		post_image = ""
		social_share_button_tag(post_title, desc: post_desc)
	end

	

	
	
end
