class Notification < ApplicationRecord
	belongs_to :user, :foreign_key =>  :sender_id, class_name:  'User'
	belongs_to :recipient, :foreign_key =>  :receiver_id, class_name:  'User'
	#@user ||= current_user

	private

	def self.unread_notification(user_id)
		where("receiver_id = ? AND read = ? ", user_id, false)
	end
end