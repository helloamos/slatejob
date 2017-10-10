class Project < ApplicationRecord
	after_initialize :set_defaults
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	belongs_to :user
  	has_many :bids
  	belongs_to :currency

  	has_many :project_skills
  	has_many :skills, :through => :project_skills

  	# Date validation
	validates_presence_of :title, :content, :time_limit, :budget, :currency_id, :status

	validates :slug, uniqueness: true 

	def set_defaults
		self.status ||= "open"
	end

	def self.select_project(project_id)
	 	where("project_id = ?", project_id)
	end
	
end
