class Project < ApplicationRecord

	# Set the default Status value
	after_initialize :set_defaults

	# Setup FriendlyID
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	# Association with User
  	belongs_to :user

  	# Association with Bid
  	has_many :bids, dependent: :destroy

  	# Association with Currency
  	#belongs_to :currency

  	# Association with Profession
  	belongs_to :profession

  	# Association with Bugdet
  	#belongs_to :budget

  	# Association with Skill through ProjectSkill
  	has_many :project_skills
  	has_many :skills, :through => :project_skills, dependent: :destroy


  	# Association with Attribution
  	has_one :attribution, :dependent => :destroy

  	# Date validation
	validates_presence_of :title, :content, :profession_id, :budget, :currency_id, :status

	validates :slug, uniqueness: true 

	def self.location(country, city)
		where("project_id = ?", project_id)
	end

	def set_defaults
		self.status ||= "open"
	end

	def self.select_project(project_id)
	 	where("project_id = ?", project_id)
	end

	def self.category(category_id)
	 	where("category_id = ?", project_id)
	end

	def self.my_project(project_id, user_id)
	 	where("id = ? AND user_id = ?", "#{project_id}","#{user_id}")
	end

	def self.check_expiration_date(current_date, status)
	 	where("expire_at < ? AND status = ?", "#{current_date}","#{status}")
	end

	#BUDGET = [["Moins de 5 000"],["15 000 - 30 000"], ["35 000 - 45 000"], ["50 000 - 75 000"], ["75 000 - 100 000"], ["100 000 - 200 000"],
 				#["200 000 - 250 000"], ["300 000 - 500 000"],  ["600 000 - 800 000"] , ["1 000 000 - 1 500 000"],  ["2 000 000 - 4 000 000"],
 				 #["Plus de 5 000 000 "]]

	
end
