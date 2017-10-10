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

	
end
