class ProjectSkill < ActiveRecord::Migration[5.1]
  def change
  	create_table :project_skills do |t|
  		t.references :project
  		t.references :skill
  		t.timestamps
  	end
  end
end
