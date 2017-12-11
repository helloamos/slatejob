class Bid < ApplicationRecord
	# Association with user
	belongs_to :user

	# Association with Attribution
	has_one :attribution

	# Association with project
	belongs_to :project

	def self.can_post_bid(user_id, project_id)
	 	where("user_id= ? and project_id = ?", "#{user_id}", "#{project_id}")
	end

end
