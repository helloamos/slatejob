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

	def do_separator(item, content)

		if item != content.last 
			html = "<hr />"
			return html.html_safe
		end
	end
end
