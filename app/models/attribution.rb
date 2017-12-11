class Attribution < ApplicationRecord
	
	# Association with Project
	belongs_to :project

	# Association with Bid
	belongs_to :bid

	# Rename association with User
	belongs_to :sender, :foreign_key =>  :sender_id, class_name:  'User'
	belongs_to :recipient, :foreign_key =>  :recipient_id, class_name:  'User'

	validates_presence_of :sender_id, :recipient_id, :project_id
	 
	def self.find_by_project_and_user(project_id, user_id) 
	 where("project_id= ? AND sender_id= ? ", "#{project_id}","#{user_id}")
	end

	def self.attributed(project_id) 
	 where("project_id= ?", "#{project_id}")
	end

	

end