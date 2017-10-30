class AttributeProject < ApplicationRecord
	

	validates_presence_of :sender_id, :receiver_id, :project_id
	 
	scope :find_by_project, -> (project_id) { where("project_id= ?", "#{project_id}")}

	

end