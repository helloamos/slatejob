class AddCategoryIdToSkill < ActiveRecord::Migration[5.1]
  def change
  	change_table :skills do |t|
  		t.references :category
  	end
  end
end
