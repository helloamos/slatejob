class Experience < ApplicationRecord
	belongs_to :user

	# Data validation
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :position, presence: true
	validates :company, presence: true
	validates :country, presence: true
	validates :task, presence: true
end
