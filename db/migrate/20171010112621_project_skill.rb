class ProjectSkill < ActiveRecord::Migration[5.1]
  def change
  	create_table :project_skills do |t|
  		t.references :project, index: true
  		t.references :skill, index: true
  		t.timestamps
  	end
  end
end
