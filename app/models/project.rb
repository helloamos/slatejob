class Project < ApplicationRecord
	after_initialize :set_defaults
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	belongs_to :user
  	has_many :bids
  	belongs_to :currency
  	belongs_to :profession

  	has_many :project_skills
  	has_many :skills, :through => :project_skills

  	# Date validation
	validates_presence_of :title, :content, :profession_id, :budget, :currency_id, :status

	validates :slug, uniqueness: true 

	def set_defaults
		self.status ||= "open"
	end

	def self.select_project(project_id)
	 	where("project_id = ?", project_id)
	end

	def self.category(category_id)
	 	where("category_id = ?", project_id)
	end

	BUDGET = [["Moins de 5 000"],["15 000 - 30 000"], ["35 000 - 45 000"], ["50 000 - 75 000"], ["75 000 - 100 000"], ["100 000 - 200 000"],
 				["200 000 - 250 000"], ["300 000 - 500 000"],  ["600 000 - 800 000"] , ["1 000 000 - 1 500 000"],  ["2 000 000 - 4 000 000"],
 				 ["Plus de 5 000 000 "]]

	
end
