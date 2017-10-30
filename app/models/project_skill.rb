class ProjectSkill < ApplicationRecord
	belongs_to :skill
	belongs_to :project, dependent: :destroy

	
end