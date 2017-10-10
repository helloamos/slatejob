class AddViewToProject < ActiveRecord::Migration[5.1]
  def change
  	change_table :projects do |t|
  		t.integer :view_number
  	end
  end
end
