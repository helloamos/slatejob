class AttributeProject < ApplicationRecord
	

	validates_presence_of :sender_id, :receiver_id, :project_id
	 
	def self.find_by_project_and_user(project_id, user_id) 
	 where("project_id= ? AND receiver_id= ? ", "#{project_id}","#{user_id}")
	end

	

end