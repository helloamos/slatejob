class AddExpirationDateToProject < ActiveRecord::Migration[5.1]
  def change
  	change_table :projects do |t|
  		t.datetime :expire_at
  	end
  end
end
