class Bid < ApplicationRecord
	belongs_to :user
	belongs_to :project

	def self.can_post_bid(user_id, project_id)
	 	where("user_id= ? and project_id = ?", "#{user_id}", "#{project_id}")
	end

end
