class Skill < ApplicationRecord
	
	has_many :user_skills
  	has_many :users, :through => :user_skills, dependent: :destroy

  	has_many :project_skills
  	has_many :project, :through => :project_skills, dependent: :destroy

  	GRADE = [["Excéllent"],["Bien"], ["Assez-bien"], ["Intermédiaire"]]

end
