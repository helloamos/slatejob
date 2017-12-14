class AddViewNumberToUsers < ActiveRecord::Migration[5.1]
  def change
  	change_table :users do |t|
  		t.bigint :view_number
  	end
  end
end
