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

	def currency_symbol(id)
		currency = Currency.find(id)
		currency.currency_symbol
	end
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

		user ||= current_user
		bids = Bid.user_have_bid_on(project_id, user.id)

		if bids.count > 0 
			false
		else
			true
		end

	end

	def skill_title(skill_id)
		skill = Skill.find(skill_id)
		skill.title
	end

	def project_skills(project_id)
		project = Project.find(project_id)
		@project_skills = project.project_skills
	end

	# Count current user unread notification
	def unread_notification
	  @notification = Notification.unread_notification(current_user).order(:created_at => "DESC")
	  notification = Notification.unread_notification(current_user).count
	end



	#User unread message
	def unread_messages
	  conversation = Conversation.get_conversation(current_user)
	  if conversation.present?
	      message = Message.where(:conversation_id => conversation).count
	    
	    else
	      message = 0
	  end
	end

	def user_details_presentation(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		presentation = user_detail.presentation
	end
	def user_contacts_city(user_id)
		user = User.find(user_id)
		user_contact = user.user_contact
		city = user_contact.city
	end
	def user_contacts_country(user_id)
		user = User.find(user_id)
		user_contact = user.user_contact
		country= user_contact.country
	end
	def user_details_occupation(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		occupation = user_detail.specialization
	end
	def user_details_availability(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		availability = user_detail.availability
	end

	def attribute_button?(project_user_id, project_id)
		attributed = AttributeProject.find_by_project(project_id)

		if current_user.id == project_user_id && attributed.blank?
			return true
		else 
			return false
		end

	end

	def bid_project_title(bid_id)
		bid = Bid.find(bid_id)
		project = Project.find(bid.project_id)
		project.title
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


	
end
