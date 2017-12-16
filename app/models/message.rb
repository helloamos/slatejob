class Message < ApplicationRecord
	belongs_to :user, :foreign_key =>  :sender_id, class_name:  'User'
	belongs_to :recipient, :foreign_key =>  :recipient_id, class_name:  'User'
	#@user ||= current_user

	private

	def self.unread_message(user_id)
		where("recipient_id = ? AND read = ? ", user_id, false)
	end
end