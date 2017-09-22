class Project < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	belongs_to :user
  	has_many :bids
  	# Date validation
	validates_presence_of :title, :content, :time_limit, :budget, :currency_id
	validates :slug, uniqueness: true 
end
