class AddCategoryIdToProject < ActiveRecord::Migration[5.1]
  def change
  	change_table :projects do |t|
  		t.references :category
  	end
  end
end
