class Bid < ApplicationRecord
	belongs_to :user
	belongs_to :project

	def self.user_have_bid_on(project_id, user_id)
	 	where("project_id = ? and user_id = ?", project_id, user_id)
	end

	

end
