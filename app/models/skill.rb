class Skill < ApplicationRecord
	belongs_to :category
	has_many :project_skills
  	has_many :projects, :through => :project_skills

end
