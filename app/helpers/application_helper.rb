
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

		bids = Bid.can_post_bid(user_id, project_id)
		project = Project.find(project_id)

		if bids.count > 0 || user_id == project.user_id
			return false
		else
			return true
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
		if user_detail.present?
			presentation = user_detail.presentation
		end
	end

	def user_details_profession(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		if user_detail.present?
			profession = user_detail.profession_id
		end
	end

	def user_details_facebook(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		facebook_link = user_detail.facebook_link
	end

	def user_details_twitter(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		twitter_link = user_detail.twitter_link
	end

	def user_details_gplus(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		gplus_link = user_detail.gplus_link
	end

	def user_details_linkedin(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		linkedin_link = user_detail.linkedin_link
	end


	def profession_title(profession_id)
		if profession_id.present?
			profession = Profession.find(profession_id)
			profession.title
		end
	end

	def user_contacts_address(user_id)
		user = User.find(user_id)
		user_contact = user.user_contact
		if user_contact.present?
			city = user_contact.address
		end
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
	def user_details_employment_type(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		employment_type = user_detail.employment_type
	end
	def is_available?(user_id)
		user = User.find(user_id)
		user_detail = user.user_detail
		availability = user_detail.availability

		if availability
			return true
		else
			return false
		end
	end


	# Check if the project is attributed?
	def attributed?(project_id)
		#attributed = AttributeProject.find_by_project_and_user(project.id, user.id)
		project = AttributeProject.attributed(project_id)

		if project.nil?

			return false
			
		else
			return true

		end

	end

	# Check if the current project is th mine.
	def my_project?(project_id, user_id)
		#user = User.find(user_id)
		project = Project.my_project(project_id, user_id)

		if project.nil?
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


	def skill_title(skill_id)
		skill = Skill.find(skill_id) 
		skill.title unless skill.nil?
	end

	def uncomplete_profile?
		user = User.find(current_user.id)
		user_detail = user.user_detail
		if user_detail.nil?
			return true
		elsif user.user_name.blank? || user_detail.profession_id.nil? || user_detail.presentation.blank?
			return true
		else
			return false
		
		end

	end

	

	
	
end
